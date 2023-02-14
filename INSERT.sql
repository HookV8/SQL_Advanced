INSERT INTO albums (album_name, release_year)
VALUES ('Tough Love: Best Of The Ballads', '2011'),
	   ('The Number of the Beast', '1982'), 
	   ('Seventh Son of a Seventh Son', '1988'), 
	   ('New Jersey', '1988'),
	   ('Blackout', '1982'),
	   ('No shame', '2019'),
	   ('Honey', '2020'),
	   ('Live At Wembley Stadium', '1986'),
	   ('Trash','1989')
	
INSERT INTO artists (artist_name)
VALUES ('Aerosmith'), ('Iron Maiden'), ('Bon Jovi'), ('Scorpions'),
	   ('Lily Allen'), ('Robin'), ('Queen'), ('Alice Cooper')
	    
INSERT INTO genres (genre_name)
VALUES ('hard rock'), ('pop'), ('disco'), ('hip hop'), ('rap'), ('rock&roll'), ('rock')

INSERT INTO tracks (track_name, album_id, playback_time)
VALUES ('Angel', 1, 00:05:08), 
	   ('Crazy', 1, 00:05:16), 
	   ('Children of the Damned', 2, 00:04:35),
	   ('The Prisoner', 2, 00:06:02), 
	   ('Seventh Son of a Seventh Son', 3, 00:09:54),
       ('My Moonchild', 3, 00:05:40), 
	   ('Bad Medicine', 4, 00:05:16), 
	   ('Blood on blood', 4, 00:06:16), 
       ('Blackout', 5, 00:03:49), 
	   ('No One Like You', 5, 00:03:57), 
       ('What Are You Waiting For', 6, 00:04:15), 
	   ('Honey', 7, 00:04:35), 
       ('We will rock you', 8, 00:02:01), 
	   ('Bohemian Rhapsody', 8, 00:05:55), 
       ('Poison', 9, 00:04:31), 
	   ('Trash', 9, 00:04:01)

INSERT INTO collections (collection_name, release_year)
VALUES ('Live Aid', '2018'), ('Discover More Classic Rock', '2020'), 
	   ('We Will Rock You 10th Anniversary Edition', '2012'), ('Best of the Best', '2010'),
	   ('Feels Good', '2021'), ('Rockslagerek', '2021'), ('Rock', '2018'), ('Song for the car', '2020') 

INSERT INTO artist_album (album_id, artist_id)
VALUES (1, 1), (2, 2), (3, 2), (4, 3), (5, 4), (6, 5), (7, 6), (8, 7), (9, 8)      

INSERT INTO artist_genre (genre_id, artist_id)
VALUES (1, 1), (1, 2), (7, 3), (7, 4), (2, 5), (2, 6), (3, 7), (7, 8), (1, 8), (2,7)

INSERT INTO track_collection (track_id, collection_id)
VALUES (1, 1), (1, 2), (1, 4), (2, 3), (2, 4), (3, 7), (12, 1), (2, 8),
	   (3, 3), (3, 6), (4, 3), (4,7), (5, 3), (2, 7), (12, 5), (11, 5),
	   (14, 1), (15, 3), (16, 3), (13, 3), (15, 7)