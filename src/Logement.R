# Function setClass() command used
# to create S4 class containing list of slots.

setClass("Logement", slots=list(id = "character",
                                adresse = "character",
                                ville = "character",
                                categorie = "character",
                                surface = "numeric",
                                prix="numeric"))


setGeneric("updatePrice", function(self) { standardGeneric("updatePrice")})
setMethod("updatePrice", 
          signature(self = "Logement"), 
          function(self) {
            if (self@categorie == "Maison"){
              self@prix = as.integer(self@prix * 1.15)
              print("Mise à jour du prix OK pour cette maison.")}
            else {
              if (self@categorie == "Appartement"){
                self@prix = as.integer(self@prix * 0.95)
                print("Mise à jour du prix OK pour cet appartement.")
              }
              else{
                print("Mise à jour du prix du bien impossible")
              }
            }
            self@prix
          }
)

