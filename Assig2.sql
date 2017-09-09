DROP TABLE IF EXISTS movie_info;

CREATE TABLE movie_info
(
  title character(30) NOT NULL,
  date_of_release date,
  director character(25),
  CONSTRAINT pk_title PRIMARY KEY (title)
)
WITH (
  OIDS=FALSE
);


COPY movie_info(title,date_of_release,director)
FROM 'C:\Users\Dora\Downloads\Assignment2\movie_info.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS movie_rate;
 CREATE TABLE movie_rate
 (
 title character(30),
 rate numeric
 )
 WITH (
  OIDS=FALSE
);



COPY movie_rate(title,rate)
FROM 'C:\Users\Dora\Downloads\Assignment2\movie-rate.csv' DELIMITER ',' CSV HEADER;
 

DROP TABLE IF EXISTS movie_res;
 CREATE TABLE movie_res
 (
  title character(30) NOT NULL,
  rate numeric,
  date_or_release date,
  director character(25),
  CONSTRAINT pk_mresul PRIMARY KEY (title)
 )
 WITH (
  OIDS=FALSE
);

INSERT INTO movie_res 
(SELECT 
  movie_info.title, 
  movie_rate.rate, 
  movie_info.date_of_release, 
  movie_info.director
FROM 
  public.movie_rate, 
  public.movie_info
WHERE movie_info.title = movie_rate.title);

SELECT * FROM movie_res;