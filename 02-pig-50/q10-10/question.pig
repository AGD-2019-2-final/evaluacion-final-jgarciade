-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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

filtered = FOREACH table GENERATE lastname, SIZE(lastname);

temp = ORDER filtered BY $1 DESC,$0;

result = LIMIT temp 5;

STORE result INTO 'output' using PigStorage(',');
