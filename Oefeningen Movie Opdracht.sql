USE movies;

#1
SELECT title FROM movie
WHERE runtime >= 120;

#2
SELECT title FROM movie
WHERE title LIKE '%teen%';

#3
SELECT DISTINCT vote_average FROM movie;

#4
SELECT title,
       revenue AS 'Revenue in €',
       revenue * 1.11 AS 'Revenue in £'
FROM movie;

#5
SELECT gender_id, COUNT(gender_id) FROM movie_cast
GROUP BY gender_id;

#6
SELECT m.title, m.movie_id, COUNT(DISTINCT language_id) from movie_languages
                                             INNER JOIN movie m on movie_languages.movie_id = m.movie_id
GROUP BY m.movie_id
HAVING COUNT(DISTINCT language_id) > 2;

#7
SELECT DISTINCT title FROM movie
INNER JOIN movie_keywords mk on movie.movie_id = mk.movie_id
INNER JOIN keyword k on mk.keyword_id = k.keyword_id
WHERE (keyword_name LIKE 'space opera') AND (title NOT LIKE '%star%');

#8
SELECT title, genre_name FROM movie
INNER JOIN movie_genres mg on movie.movie_id = mg.movie_id
INNER JOIN genre g on mg.genre_id = g.genre_id
WHERE genre_name LIKE 'Horror';

#9
SELECT genre_id, COUNT(genre_id) from movie_genres
                                 GROUP BY genre_id
                                 HAVING COUNT(genre_id) = 0;

#10
SELECT person_name, COUNT(movie_cast.person_id) from movie_cast
                                   LEFT JOIN person p on movie_cast.person_id = p.person_id
GROUP BY person_name
ORDER BY COUNT(movie_cast.person_id) DESC
LIMIT 5;

#11a
SELECT title FROM movie
WHERE (runtime > (SELECT AVG(runtime) FROM movie))
ORDER BY title;

#11b
SELECT title FROM movie
WHERE (runtime > (SELECT AVG(runtime) FROM movie WHERE runtime > 90))
ORDER BY title;

CREATE TABLE message (
msg_id INT AUTO_INCREMENT,
message VARCHAR(255),
user_id INT NOT NULL,
receiver_id INT NOT NULL,PRIMARY KEY (msg_id)
);
CREATE TABLE usr (
usr_id INT,
login VARCHAR(50),
email VARCHAR(255)
);

#12
INSERT INTO USR VALUES (1, 'rincewind', 'rincewind@discworld.org' );

#13
INSERT INTO USR (usr_id, login, email) VALUES
(2, 'Bursar', 'bursar@unseen.university'), (3, 'archchancellor', 'arch@unseen.university');

#14
INSERT INTO message(message, user_id, receiver_id) VALUES ('Bursar?',3,2),('Yes, Archchancellor?"',2,3),('You aren''t a member of some
secret society or somethin'', are you?',3,2),('Me? No, Archchancellor.',2,3),('Thenit''d be a damn good idea to take your
underpants off your head',3,2);

#15
UPDATE usr SET email = 'rincewind@unseen.university' WHERE email LIKE 'rincewind@discworld.org';

#16
DELETE FROM message WHERE user_id = 2;