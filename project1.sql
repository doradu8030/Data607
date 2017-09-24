DROP TABLE IF EXISTS tournamentfinal;

CREATE TABLE tournamentfinal
(
  id character(10),	
  playername character(30) NOT NULL,
  payerstate character(30),
  totnumpoints character(10),
  round1 character(10),
  round2 character(10),
  round3 character(10),
  round4 character(10),
  round5 character(10),
  round6 character(10),
  round7 character(10),
  prerating integer,
  avgprerateoppon integer,
  CONSTRAINT pk_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


COPY tournamentfinal(id,playername,payerstate,totnumpoints,round1,round2,round3,round4,round5,
  round6,round7,prerating,avgprerateoppon)
FROM 'C:\Users\Dora\Downloads\Assignment2\tournamentfinal.csv' CSV DELIMITER ',' HEADER;



SELECT * FROM tournamentfinal;