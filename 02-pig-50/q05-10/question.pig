-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

table = LOAD 'data.tsv' USING PigStorage('\t') AS (letter: CHARARRAY, myJson: BAG{t:(p:CHARARRAY)}, myList: MAP[]);

extracted = FOREACH table GENERATE FLATTEN(myJson);

grouped = GROUP extracted BY $0;

counter = FOREACH grouped GENERATE group, COUNT(extracted);

STORE counter INTO 'output';
