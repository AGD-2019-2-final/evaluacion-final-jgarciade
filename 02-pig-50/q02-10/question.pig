-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 


table = LOAD 'data.tsv' USING PigStorage('\t')
  AS (letter: CHARARRAY, myDate: CHARARRAY, id: INT);

grouped = ORDER table BY letter,id;

STORE grouped INTO 'output';
