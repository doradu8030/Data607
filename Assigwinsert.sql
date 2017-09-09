
DROP TABLE IF EXISTS movie_rate;
 CREATE TABLE movie_rate 
 (
 title character(20) NOT NULL,
 rate numeric
 )
 WITH (
  OIDS=FALSE
);

INSERT INTO movie_rate(
            title, rate)
    VALUES ('Jumanji', 5);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('ThorRagnarok', 3);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('SpiderMan', 4);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('WonderWoman', 5);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('Fast & Furious8', 5);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('Cinderella', 3);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('KongSkullIsland', 2);
INSERT INTO movie_rate(
            title, rate)
    VALUES ('TheLegoBatman', 4);

DROP TABLE IF EXISTS movie_info;


CREATE TABLE movie_info
(
  title character(20) NOT NULL,
  date_of_release date,
  director character(20),
  CONSTRAINT pk_title PRIMARY KEY (title)
)
WITH (
  OIDS=FALSE
);

INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('Jumanji', '12/15/1995','Joe Johnstone');
INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('ThorRagnarok','5/6/2011','Kenneth Branagh');               

INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('SpiderMan','5/3/2002','Sam Raimi');              

INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('WonderWoman','6/2/2017','Patty Jenkins');                

INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('Fast & Furious8','4/4/2017','F Gary Gray');
                      
INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('Cinderella','3/13/2015','Kenneth Branagh');               
 
INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('KongSkullIsland','3/10/2017','Jordan Vogt-Roberts');
                
 INSERT INTO movie_info(
            title, date_of_release, director)
    VALUES ('TheLegoBatman','2/10/2017','Chris Mckay');

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