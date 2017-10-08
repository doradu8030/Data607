DROP TABLE IF EXISTS tmp_x;  
CREATE TABLE tmp_x
(
YearStart text,
YearEnd text,
LocationAbbr text,
LocationDesc text,
DataSource text, 
Topic text,
Question text,
Response text,
DataValueUnit text, 
DataValueType text,
Datavalue text,
DataValueAlt text,
DataValueFootnotesSymbol text,
DatavalueFootnote text, 
LowConfidenceLimit text, 
HighConfidenceLimit text, 
StratificationCategory1 text,
Stratification1 text, 
StratificationCategory2 text, 
Stratification2 text, 
StratificationCategory3 text,
Stratification3 text, 
GeoLocation text, 
ResponseID text,
LocationID text, 
TopicID text, 
QuestionID text, 
DataValueTypeID text, 
StratificationCategoryID1 text,
StratificationID1 text,
tratificationCategoryID2 text,
StratificationID2 text,
tratificationCategoryID3 text,
StratificationID3 text
)
WITH (
  OIDS=FALSE
);

COPY tmp_x(YearStart,YearEnd,LocationAbbr,LocationDesc,DataSource,Topic,Question,Response,DataValueUnit,DataValueType,Datavalue,
DataValueAlt,
DataValueFootnotesSymbol,
DatavalueFootnote,
LowConfidenceLimit,
HighConfidenceLimit,
StratificationCategory1,
Stratification1,
StratificationCategory2,
Stratification2,
StratificationCategory3,
Stratification3,
GeoLocation, 
ResponseID,
LocationID,
TopicID,
QuestionID,
DataValueTypeID,
StratificationCategoryID1,
StratificationID1,
tratificationCategoryID2,
StratificationID2,
tratificationCategoryID3,
StratificationID3)
FROM 'C:\Users\Dora\Downloads\Assignment2\US Chronic disease indicators.csv' DELIMITER ',' CSV HEADER; 

DROP TABLE IF EXISTS state_chronic;
 CREATE TABLE state_chronic
 (
  yearstart text,
  yearend text, 
  LocationAbbr text,
  topic text, 
  question text, 
  datavaluetype text, 
  datavalue text, 
  questionID text,
  stratification1 text, 
  stratificationid1 text
 )
 WITH (
  OIDS=FALSE
);

INSERT INTO state_chronic 
(SELECT 
  tmp_x.yearstart, 
  tmp_x.yearend,
  tmp_x.locationabbr,
  tmp_x.topic, 
  tmp_x.question, 
  tmp_x.datavaluetype, 
  tmp_x.datavalue,
  tmp_x.questionid,  
  tmp_x.stratification1, 
  tmp_x.stratificationid1 
FROM 
   public.tmp_x
WHERE 
  (tmp_x.yearstart >= '2015' OR
  tmp_x.yearstart >= '2015') AND
  tmp_x.locationabbr LIKE 'NY');
  
  SELECT * FROM state_chronic; 