
#What do I need?
## Functions

# Function that defines a species by pulling L numbers randomly from 1:K
define.species<-function(L,K){        #function takes in number of traits (L) and 
                                      #the K*K matrix of trait matches
  traits<-sample(1:K,L)               #pick out the L traits from 1:K
  return(traits)                      #outputs trait vector
}

# Function that compares new species to old species to see if they are the same or different
species.check<-function(spA,sp.list){ # inputs will be new species and the list of old species
  
}
  
# Function that then compares the traits between two species to determine the score.Is there:
trait.score<-function(s1,s2,k.mat){         #input is two trait vectors and the K matrix
  score.vector<-c()
  for (i in 1:L){
    score.vector[i]<-k.mat[s1[i],s2[i]]
  }
  score<-sum(score.vector)
  return(score)
  #caldarelli.score<-max(0,(1/L)*score)  # based on Caldarelli et al 1998
  #return(caldarelli.score)
}

#### 1. An interaction 
is.interaction<-function(score,threshold){
  ifelse(score>threshold,return("Interaction"),return("No Interaction"))
}

#### 2. If there is an interaction:

######## a. What is the interaction strength

# Function governing population dynamics to be fed into the solver

# Function which determines if there is a speciation event determined by population size

