-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

table = LOAD 'data.tsv' USING PigStorage('\t')
  AS (letter: CHARARRAY, myDate: CHARARRAY, id: INT);

grouped = ORDER table BY id ASC;
limited = LIMIT grouped 5;
result = FOREACH limited GENERATE id;

STORE result INTO 'output';
