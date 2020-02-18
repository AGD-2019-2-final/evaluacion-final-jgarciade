-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

table = LOAD 'data.tsv' USING PigStorage('\t') AS (letter: CHARARRAY, myJson: BAG{t:(p:CHARARRAY)}, myList: MAP[]);

table_filtered = FOREACH table GENERATE FLATTEN(myJson), FLATTEN(myList);

grouped = GROUP table_filtered BY ($0, $1);

result = FOREACH grouped GENERATE group, COUNT(table_filtered);

STORE result INTO 'output';
