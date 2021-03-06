###Re-writing the environ function from scratch

new_environ <- function(x,err.tol=1e-10){
  n <- nrow(x%n%'flow')
                                        #Setup arrays
                                        #Throughflow environs
  E <- array(0,c((n+1),(n+1),n))
  colnames(E) <- c(rownames(x%n%'flow'),'z')
  rownames(E) <- c(rownames(x%n%'flow'),'y')
  EP <- E*0
                                        #Storage environs
  SE <- E*0
  SEP <- E*0
                                        #Throughflow unit environs
  G <- enaFlow(oyster)$G
  GP <- enaFlow(oyster)$GP
  N <- enaFlow(oyster)$N
  NP <- enaFlow(oyster)$NP
                                        #Output
  for (i in 1:n){
    E[1:n,1:n,i] <- G %*% diag(N[,i])
    E[1:n,1:n,i] <- E[1:n,1:n,i] - diag(N[,i])
    E[1:n,n+1,i] <- apply((-E[1:n,1:n,i]),1,sum)
    E[n+1,1:n,i] <- apply((-E[1:n,1:n,i]),2,sum)
  }
                                        #Input
  for (i in 1:n){
    EP[1:n,1:n,i] <- diag(NP[i,]) %*% GP
    EP[1:n,1:n,i] <- EP[1:n,1:n,i] - diag(NP[i,])
    EP[1:n,n+1,i] <- apply((-EP[1:n,1:n,i]),1,sum)
    EP[n+1,1:n,i] <- apply((-EP[1:n,1:n,i]),2,sum)
  }
                                        #Storage
  P <- enaStorage(x)$P
  PP <- enaStorage(x)$PP
  Q <- enaStorage(x)$Q
  QP <- enaStorage(x)$QP
                                        #Output
  for (i in 1:n){
    SE[1:n,1:n,i] <- P %*% diag(Q[,i])
    SE[1:n,1:n,i] <- SE[1:n,1:n,i] - diag(Q[,i])
    SE[1:n,n+1,i] <- apply(-SE[1:n,1:n,i],1,sum)
    SE[n+1,1:n,i] <- apply(-SE[1:n,1:n,i],2,sum)
  }
                                        #Input
  for (i in 1:n){
    SEP[1:n,1:n,i] <- diag(QP[i,]) %*% PP
    SEP[1:n,1:n,i] <- SEP[1:n,1:n,i] - diag(QP[i,])
    SEP[1:n,n+1,i] <- apply(-SEP[1:n,1:n,i],1,sum)
    SEP[n+1,1:n,i] <- apply(-SEP[1:n,1:n,i],2,sum)
  }

out <- list(E=E,EP=EP,SE=SE,SEP=SEP)

return(out)

}

