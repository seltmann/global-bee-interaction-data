################################## 
# Author: Katja C. Seltmann
# Email: enicospilus@gmail
# Date: November, 2020
# Purpose: separate out all bee records from GloBI review
################################## 


echo Creating headers
head -1 output/2022-04-29/indexed_interactions_full.tsv > Andrenidae_data.tsv
head -1 output/2022-04-29/indexed_interactions_full.tsv > Apidae_data.tsv
head -1 output/2022-04-29/indexed_interactions_full.tsv > Colletidae_data.tsv
head -1 output/2022-04-29/indexed_interactions_full.tsv > Halictidae_data.tsv
head -1 output/2022-04-29/indexed_interactions_full.tsv > Megachilidae_data.tsv
head -1 output/2022-04-29/indexed_interactions_full.tsv > Melittidae_data.tsv
head -1 output/2022-04-29/indexed_interactions_full.tsv > Stenotritidae_data.tsv

#find all Andrenidae and write one file with all data and a second file only with unique records

echo Finding all Andrenidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Andrenidae" >> Andrenidae_data.tsv
wc -l Andrenidae_data.tsv

echo Sorting unique records
sort -r Andrenidae_data.tsv | uniq > Andrenidae_data_unique.tsv
wc -l Andrenidae_data_unique.tsv
#####################################
#find all Apidae and write one file with all data and a second file only with unique records

echo Finding all Apidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Apidae" >> Apidae_data.tsv
wc -l Apidae_data.tsv

echo Sorting unique records
sort -r Apidae_data.tsv | uniq > Apidae_data_unique.tsv
wc -l Apidae_data_unique.tsv
#####################################
#find all Colletidae and write one file with all data and a second file only with unique records

echo Finding all Colletidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Colletidae" >> Colletidae_data.tsv
wc -l Colletidae_data.tsv

echo Sorting unique records
sort -r Colletidae_data.tsv | uniq > Colletidae_data_unique.tsv
wc -l Colletidae_data_unique.tsv
#####################################
#find all Halictidae and write one file with all data and a second file only with unique records

echo Finding all Halictidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Halictidae" >> Halictidae_data.tsv
wc -l Halictidae_data.tsv

echo Sorting unique records
sort -r Halictidae_data.tsv | uniq > Halictidae_data_unique.tsv
wc -l Halictidae_data_unique.tsv
#####################################
#find all Megachilidae and write one file with all data and a second file only with unique records

echo Finding all Megachilidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Megachilidae" >> Megachilidae_data.tsv
wc -l Megachilidae_data.tsv

echo Sorting unique records
sort -r Megachilidae_data.tsv | uniq > Megachilidae_data_unique.tsv
wc -l Megachilidae_data_unique.tsv
#####################################
#find all Melittidae and write one file with all data and a second file only with unique records

echo Finding all Melittidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Melittidae" >> Melittidae_data.tsv
wc -l Melittidae_data.tsv

echo Sorting unique records
sort -r Melittidae_data.tsv | uniq > Melittidae_data_unique.tsv
wc -l Melittidae_data_unique.tsv
#####################################
#find all Stenotritidae and write one file with all data and a second file only with unique records

echo Finding all Stenotritidae
cat output/2022-04-29/indexed_interactions_full.tsv | grep -w "Stenotritidae" >> Stenotritidae_data.tsv
wc -l Stenotritidae_data.tsv

echo Sorting unique records
sort -r Stenotritidae_data.tsv | uniq > Stenotritidae_data_unique.tsv
wc -l Stenotritidae_data_unique.tsv

#####################################
#create one large bee file
cat *unique.tsv >> all_bee_data.txt
sort -r all_bee_data.txt | uniq > indexed_interactions_bees.tsv

#####################################
#get counts for each collection
cat indexed_interactions_bees.tsv | cut -f6 | sort > out.txt
cat out.txt | uniq -c
