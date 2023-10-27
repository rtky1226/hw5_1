llr=function(x,y,z,omega){
  fits=sapply(z,compute_f_hat,x,y,omega) 
  return(fits) 
}

compute_f_hat=function(z,x,y,omega){
  Wz=make_weight_matrix(z,x,omega) 
  X=make_predictor_matrix(x) 
  f_hat=c(1,z) %*% solve(t(X) %*% Wz %*% X) %*% t(X) %*% Wz %*% y 
  return(f_hat) 
}

make_weight_matrix <- function(z,x,omega){
  r = abs(x - z) / omega
  W_values = ifelse(abs(r) < 1, (1 - abs(r)^3)^3, 0)
  Wz = diag(W_values)
  return(Wz)
}


make_predictor_matrix <- function(x){
  X = cbind(1,x)
  return(X)
}


make_weight_matrix_new <- function(z,x,omega){
  r = abs(x - z) / omega
  W_values = ifelse(abs(r) < 1, (1 - abs(r)^3)^3, 0)
  Wz = diag(W_values)
  return(W_values)
}


compute_f_hat_new=function(z,x,y,omega){
  Wz=make_weight_matrix_new(z,x,omega) 
  X=make_predictor_matrix(x) 
  result_x = sweep(X,1,Wz,`*`)
  f_hat=c(1,z)%*%solve(t(X)%*% result_x )%*%t(X)%*%(Wz*y)
  
  
  return(f_hat) 
}

llr_new=function(x,y,z,omega){
  fits=sapply(z,compute_f_hat_new,x,y,omega) 
  return(fits) 
}




