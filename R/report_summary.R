report_summary <- function(data, measure, na.rm = TRUE, quantiles = NULL){
  
  if(measure == "mean"){
    out <- mean(x = data, na.rm = na.rm)
  } else if(measure == "median"){
    out <- median(x = data, na.rm = na.rm)  
  }
  out <- round(x = out, digits = 2)
  
  if(!is.null(quantiles)){
    out <- c(out, quantile(data, probs = quantiles, na.rm = na.rm))
  }
  names(out)[1] <- measure
  
  return(out)
}
