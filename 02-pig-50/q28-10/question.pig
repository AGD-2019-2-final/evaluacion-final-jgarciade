-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        birthday, 
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM 
--        persons
--    LIMIT
--        5;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

table = LOAD 'data.csv' USING PigStorage(',') AS (row: CHARARRAY, name: CHARARRAY, lastname: CHARARRAY, myDate: CHARARRAY, color: CHARARRAY, id: CHARARRAY);

result = FOREACH table GENERATE SUBSTRING(myDate, 0, 4), SUBSTRING(myDate, 2, 4);

STORE result INTO 'output' using PigStorage(',');
