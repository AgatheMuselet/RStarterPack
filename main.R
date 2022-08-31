
monchemin="C:/Users/kpbz2589/Documents/demo_projetR/"

install.packages(paste0(monchemin,"mesfonctionspartagees_0.0.0.9000.tar.gz",sep=""), repos = NULL, type="source")

library(mesfonctionspartagees)

ls("package:mesfonctionspartagees") #lister les fonctions du package


##fonctions spécifique projet
source(paste0("./src/",list.files("./src/")))


# Loading data source into a dataframe.
logements_df = mesfonctionspartagees::ImportData("./data/input/Mars2022.csv")

# Instantiation of lodgings from the loaded data.
logements_list=list()
for (i in (1:nrow(logements_df))){
  logements_list[[i]]<- new("Logement", id=rownames(logements_df)[i], adresse=logements_df$Adresse[i],ville=logements_df$Ville[i],categorie=logements_df$Categorie[i],surface=logements_df$Surface[i],prix=logements_df$Prix[i])
}

# Call the class method to update the price of each lodging.
for (k in (1:length(logements_list))){
  logements_list[[k]]@prix=updatePrice(logements_list[[k]])
}



print("Mise à jour des données terminée.")


##transformation objet liste S4 en dataframe
S4_to_dataframe <- function(s4obj) {
  nms <- slotNames(s4obj)
  
  lst <- lapply(nms, function(nm) slot(s4obj, nm))
  as.data.frame(setNames(lst, nms))
}


meslogements_update<-as.data.frame(t(sapply(logements_list,S4_to_dataframe)))   
mon_update<-as.data.frame(lapply(meslogements_update, unlist))

monoutput<- new("ExportData", monjdd="mon_update", filename="./data/outpout/Avril2022.csv")

# Export data to a new CSV file.
export(monoutput)
