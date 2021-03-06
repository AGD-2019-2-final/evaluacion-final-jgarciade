--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        color 
--    FROM 
--        u 
--    WHERE 
--        color NOT LIKE 'b%';
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

filtered = FOREACH table GENERATE color;

result = FILTER filtered BY (NOT $0 MATCHES '^[b].*');

STORE result INTO 'output' using PigStorage(',');
