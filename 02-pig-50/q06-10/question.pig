-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

table = LOAD 'data.tsv' USING PigStorage('\t') AS (letter: CHARARRAY, myJson: BAG{t:(p:CHARARRAY)}, myList: MAP[]);

table_extracted = FOREACH table GENERATE FLATTEN(myList);

grouped = GROUP table_extracted BY $0;

counter = FOREACH grouped GENERATE group, COUNT(table_extracted) as temp:CHARARRAY;

result = FOREACH counter GENERATE CONCAT(group, ',', temp);

STORE result INTO 'output';
