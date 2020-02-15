-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- Loads data
table = LOAD 'data.tsv' USING PigStorage('\t')
  AS (letter: CHARARRAY, myDate: CHARARRAY, id: INT);

-- Creates a line per letter
letters = FOREACH table GENERATE letter;

-- groups by letter
grouped = GROUP letters by letter;

-- counts
wordcount = FOREACH grouped GENERATE group, COUNT(letters);

-- stores the result
STORE wordcount INTO 'output';
