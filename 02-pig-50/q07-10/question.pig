-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

table = LOAD 'data.tsv' USING PigStorage('\t') AS (letter: CHARARRAY, myJson: BAG{t:(p:CHARARRAY)}, myList: MAP[]);

counter = FOREACH table GENERATE letter, COUNT_STAR(myJson) as ld1:CHARARRAY, SIZE(myList) as ld2:CHARARRAY;

temp = FOREACH counter GENERATE CONCAT($0, ',' , ld1 , ',' , ld2) as final;

result = ORDER temp BY final;

STORE result INTO './output' using PigStorage(',');
