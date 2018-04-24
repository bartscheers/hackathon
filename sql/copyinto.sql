COPY 2000000 RECORDS
INTO runcat
FROM '/scratch/bscheers/github/hackathon/hackathon_dump.csv'
USING DELIMITERS ';', '\n' NULL AS ''
;

