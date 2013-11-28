source("ww_functions.R")
# Define K, the total number of traits in the system
K<-500

# Define L, the number of traits defining a species
L<-10

# Define the external environment node
n.0<-sample(1:K,L)

# Create K*K matrix
set.seed(5) #set the seed so that the matrix remains the same

trait.scores<-rnorm(250000,0,1) # Caldarelli assumes antisymmetric matrix, 
                                # but I do not know if that is necessary

K.mat<-matrix(trait.scores,nrow=K,ncol=K)


# Set the threshold for scores
# Caldarelli uses a max(0,sum of mij) function where positive value indicates interaction
# Zero means no interaction
#######################################
#######################################
sampler<-function(x){
  vec<-sample(x,10)
  return(sum(vec))
}

test1<-replicate(1000000,sampler(trait.scores))

hist(test1,freq=F)
quantile(test1)
#######################################
#######################################
threshold<-2.11 # set to be the 75% quantile of the distribution above

# 


# Test the functions. Defines two species determines their score and whether there is an interaction
int<-c()
for(i in 1:100){
speciesA<-define.species(L,K)
speciesB<-define.species(L,K)

score<-trait.score(speciesA,speciesB,K.mat)
int[i]<-(is.interaction(score,threshold))
}

sum(int=="Interaction")