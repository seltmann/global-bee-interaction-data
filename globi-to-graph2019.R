# Katja Seltmann, 2019
# M259 Visualizing Information

#download data from globi using r API
#https://www.globalbioticinteractions.org
#create simple network with the data
#code modified slightly from https://cran.r-project.org/web/packages/rglobi/index.html

rm(list=ls())


#install packages if you dont have them
install.packages("rglobi")


#load packages
library(rglobi)
library(ggplot2)
library("dplyr")
library("tidyr")
require(igraph)


#How many Apidae records are in Globi?
#pagenation, but unclear about limit of number
otherkeys = list("limit"=50000, "skip"=0)

first_page_of_ten <- get_interactions_by_taxa(sourcetaxon = "Apidae", otherkeys = otherkeys)

otherkeys = list("limit"=50000, "skip"=10000)

second_page_of_ten <- get_interactions_by_taxa(sourcetaxon = "Apidae", otherkeys = otherkeys)

#total records for Apidae is 84227
#same total if use get_interactions_by_taxa(sourcetaxon = NULL,targettaxon = "Apidae", otherkeys = otherkeys)

total <- rbind(first_page_of_ten,second_page_of_ten)

#how many rows in this dataset

nrow(total)

####################################################################################

#look at the different interaction types
interactions_types <- get_interaction_types()
View(interactions_types)

#get interaction dataset
interactions <- data.frame(total$source_taxon_name,total$target_taxon_name,total$interaction_type)

head(interactions)

#create a new dataframe for a network graph (vertex, edges)
bsk <- data.frame(total$source_taxon_name,total$target_taxon_name)

nrow(bsk)

#unique taxa
unique(total$source_taxon_name)

#need to filter by interaction type
unique(total$target_taxon_name)
unique(total$source_taxon_name)

#look at data
head(bsk)
tail(bsk)

#vosnesenskii <- filter(bsk, total.source_taxon_name=="Calyptra minuticornis")

#crotchii <- filter(bsk, total.source_taxon_name=="Bombus crotchii")
"Bombus crotchii"

#describe network
bsk.network<-graph.data.frame(bsk, directed=F)

#bipartite network
g <- graph.incidence(bsk, weighted = T)

#list the vertices
V(bsk.network)

#list the edges
E(bsk.network)

#plot the graph
plot(bsk.network,vertex.size=5, vertex.label=V, layout=layout_in_circle)

V(g)
E(g)

plot(g ,vertex.size=5, vertex.label=NA, layout=layout_as_bipartite)


#find all functions in rglobi package
lsp <- function(package, all.names = FALSE, pattern) 
{
  package <- deparse(substitute(package))
  ls(
    pos = paste("package", package, sep = ":"), 
    all.names = all.names, 
    pattern = pattern
  )
}

lsp(rglobi)



