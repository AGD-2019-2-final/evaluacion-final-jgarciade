--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE color = 'blue' AND firstname LIKE 'Z%';
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

table = LOAD 'data.csv' USING PigStorage(',') AS (row: CHARARRAY, name: CHARARRAY, lastname: CHARARRAY, myDate: DATETIME, color: CHARARRAY, id: CHARARRAY);

filtered = FOREACH table GENERATE name, color;

result = FILTER filtered BY ($1 matches '.*blue.*') AND ($0 matches '.*Z.*');

STORE result INTO 'output' using PigStorage('\t');
