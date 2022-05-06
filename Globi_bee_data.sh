################################## 
# Author: Katja C. Seltmann
# Email: enicospilus@gmail
# Date: November, 2020
# Purpose: separate out all bee records from GloBI review
################################## 


echo Creating headers
head -1  data/interactions.csv > Andrenidae_data.csv
head -1  data/interactions.csv > Apidae_data.csv
head -1  data/interactions.csv > Colletidae_data.csv
head -1  data/interactions.csv > Halictidae_data.csv
head -1  data/interactions.csv > Megachilidae_data.csv
head -1  data/interactions.csv > Melittidae_data.csv
head -1  data/interactions.csv > Stenotritidae_data.csv

#find all Andrenidae and write one file with all data and a second file only with unique records

echo Finding all Andrenidae
cat  data/interactions.csv | grep -w "Andrenidae" >> Andrenidae_data.csv
wc -l Andrenidae_data.csv

echo Sorting unique records
sort -r Andrenidae_data.csv | uniq > Andrenidae_data_unique.csv
wc -l Andrenidae_data_unique.csv
#####################################
#find all Apidae and write one file with all data and a second file only with unique records

echo Finding all Apidae
cat  data/interactions.csv | grep -w "Apidae" >> Apidae_data.csv
wc -l Apidae_data.csv

echo Sorting unique records
sort -r Apidae_data.csv | uniq > Apidae_data_unique.csv
wc -l Apidae_data_unique.csv
#####################################
#find all Colletidae and write one file with all data and a second file only with unique records

echo Finding all Colletidae
cat  data/interactions.csv | grep -w "Colletidae" >> Colletidae_data.csv
wc -l Colletidae_data.csv

echo Sorting unique records
sort -r Colletidae_data.csv | uniq > Colletidae_data_unique.csv
wc -l Colletidae_data_unique.csv
#####################################
#find all Halictidae and write one file with all data and a second file only with unique records

echo Finding all Halictidae
cat  data/interactions.csv | grep -w "Halictidae" >> Halictidae_data.csv
wc -l Halictidae_data.csv

echo Sorting unique records
sort -r Halictidae_data.csv | uniq > Halictidae_data_unique.csv
wc -l Halictidae_data_unique.csv
#####################################
#find all Megachilidae and write one file with all data and a second file only with unique records

echo Finding all Megachilidae
cat  data/interactions.csv | grep -w "Megachilidae" >> Megachilidae_data.csv
wc -l Megachilidae_data.csv

echo Sorting unique records
sort -r Megachilidae_data.csv | uniq > Megachilidae_data_unique.csv
wc -l Megachilidae_data_unique.csv
#####################################
#find all Melittidae and write one file with all data and a second file only with unique records

echo Finding all Melittidae
cat  data/interactions.csv | grep -w "Melittidae" >> Melittidae_data.csv
wc -l Melittidae_data.csv

echo Sorting unique records
sort -r Melittidae_data.csv | uniq > Melittidae_data_unique.csv
wc -l Melittidae_data_unique.csv
#####################################
#find all Stenotritidae and write one file with all data and a second file only with unique records

echo Finding all Stenotritidae
cat  data/interactions.csv | grep -w "Stenotritidae" >> Stenotritidae_data.csv
wc -l Stenotritidae_data.csv

echo Sorting unique records
sort -r Stenotritidae_data.csv | uniq > Stenotritidae_data_unique.csv
wc -l Stenotritidae_data_unique.csv

#####################################
#create one large bee file
cat *unique.csv >> all_bee_data.txt
sort -r all_bee_data.txt | uniq > indexed_interactions_bees.csv

#####################################
#get counts for each collection
cat indexed_interactions_bees.csv | cut -f6 | sort > out_temp.txt
cat out_temp.txt | uniq -c > out.txt
rm out_temp.txt

#sourceCitation
cat indexed_interactions_bees.tsv | cut -f88 | sort > citation_out.txt
cat citation_out.txt | uniq -c > uniq_citations.txt
