-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        REGEX_EXTRACT(birthday, '....-..-..', 2) 
--    FROM 
--        u;
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

result = FOREACH table GENERATE REGEX_EXTRACT(myDate, '(\\d{4})-(\\d{2})-(\\d{2})', 2) AS (number:CHARARRAY);

STORE result INTO 'output' using PigStorage(',');
