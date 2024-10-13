#Prodigy InfoTech Task 1
install.packages("ggplot2")
library(ggplot2)
data<-read.csv("C:/Users/priya/Downloads/population data.csv")#load data
#selecting relavent colunm
#country and population for 2023
data_2023<-data[,c("Country.Name","X2023")]
#Renaming the colunms for simplicity
colnames(data_2023)<-c("Country.Name","Population")
data_2023$Population<-as.numeric(data_2023$Population)
#filter out rows with missing data
cleaned_data<-data_2023[!is.na(data_2023$Population)&data_2023$Population>0,]
top_10<-cleaned_data[order(-cleaned_data$Population),][1:10,]
#create bar chart
ggplot(top_10,aes(x=reorder(Country.Name,-Population),y=Population))+geom_bar(stat="identity",fill="steelblue")+labs(title="Top 10 Most Populated Countries in 2023",x="Country",y="Total Population")
ggplot(cleaned_data,aes(x=Population))+geom_density(fill="steelblue")+labs(title="Density Plot of Country Population in 2023",x="Population",y="Density")
