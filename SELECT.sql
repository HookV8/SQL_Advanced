/* количество исполнителей в каждом жанре */
SELECT genre_name, count(artist_name) 
  FROM artist_genre ag  
  	   JOIN genres g 
  	   ON g.genre_id  = ag.genre_id  
  	   JOIN artists a 
  	   ON a.artist_id = ag.artist_id  
 GROUP BY genre_name;

/*количество треков, вошедших в альбомы 2019-2020 годов*/
SELECT count(track_name) 
  FROM tracks t 
  	   JOIN albums a 
  	   ON a.album_id = t.album_id 
 WHERE a.release_year BETWEEN 2019 AND 2020;

/*средняя продолжительность треков по каждому альбому*/  
SELECT album_name, avg(playback_time) 
  FROM tracks t 
  	   JOIN albums a 
  	   ON a.album_id = t.album_id 
 GROUP BY album_name;
 
/*все исполнители, которые не выпустили альбомы в 2020 году*/
SELECT artist_name 
  FROM artists
 WHERE artist_name NOT IN
 	   (SELECT artist_name 
 	      FROM artist_album aa 
  			   JOIN artists a 
  			   ON a.artist_id = aa.artist_id
  			   JOIN albums a2 
  			   ON a2.album_id = aa.album_id  
 		 WHERE release_year = 2020);

/*названия сборников, в которых присутствует конкретный исполнитель (Aerosmith)*/
SELECT collection_name
  FROM collections c 
  	   JOIN track_collection tc 
  	   ON c.collection_id = tc.collection_id 
  	   JOIN tracks t 
  	   ON t.track_id = tc.track_id 
  	   JOIN albums a 
  	   ON a.album_id = t.album_id 
  	   JOIN artist_album aa 
  	   ON a.album_id = aa.album_id
  	   JOIN artists a2 
  	   ON a2.artist_id = aa.album_id 
 WHERE a2.artist_name = 'Aerosmith';

/*название альбомов, в которых присутствуют исполнители более 1 жанра*/
SELECT album_name
  FROM albums a 
	   JOIN artist_album aa 
	   ON a.album_id = aa.album_id 
	   JOIN artists a2 
	   ON aa.artist_id = a2.artist_id 
	   JOIN artist_genre ag 
	   ON a2.artist_id = ag.artist_id 
	   JOIN genres g 
	   ON g.genre_id = ag.genre_id 
 GROUP BY album_name 
		  HAVING count(genre_name) > 1; 

/*наименование треков, которые не входят в сборники*/
SELECT track_name 
  FROM tracks t
  	   LEFT JOIN track_collection tc 
  	   ON t.track_id = tc.track_id 
 WHERE collection_id IS NULL;

/*исполнителя(-ей), написавшего самый короткий по продолжительности трек*/
SELECT artist_name, playback_time 
  FROM artists a 
  	   JOIN artist_album aa 
  	   ON a.artist_id = aa.artist_id 
  	   JOIN albums a2 
  	   ON a2.album_id = aa.album_id 
  	   JOIN tracks t 
  	   ON t.album_id = a2.album_id
 WHERE playback_time = 
 	   (SELECT min(playback_time) 
 		  FROM tracks)

/*название альбомов, содержащих наименьшее количество треков*/						  
SELECT DISTINCT album_name 
  FROM albums a 
       LEFT JOIN tracks t ON t.album_id = a.album_id 
 WHERE t.album_id IN
 	   (SELECT album_id FROM tracks  
    	 GROUP BY album_id 
    		   HAVING count(album_id) = 
	    		      (SELECT count(track_id)
	         		     FROM tracks  
	          		    GROUP BY album_id 
	         		    ORDER BY count
	         		    LIMIT 1))					


