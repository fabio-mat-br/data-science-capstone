# AUXILIAR FUNCTIONS
source('load_data.R')


trim <- function(input_string){
  return(gsub("^ *|(?<= ) | *$", "", input_string, perl = TRUE))
}


predict_n_grams <- function(text) {
  if(text != ""){
    clean_text <- gsub("[^a-zA-Z\n\']", " ", tolower(text))
    if (clean_text != "") {
      words <- unlist(str_split(clean_text," "))
      n <- length(words)
      ngram <- c()
      word_name <- c()
      for(i in 1:n){
        if(words[i] != ""){
          word_name <- c(word_name, paste0('w', i, sep = ""))
          ngram <- c(ngram, i = words[i])
        }
      }
      names(ngram) <- word_name
      ngram <- list(ngram)
      return(predict_based_in_ngram(as.list(ngram)))
    }
  } else {
    return(start_predict())
  }
}


predict_based_in_ngram <- function(ng){
  ng_length = length(ng[[1]])
  pred_words <- load_n_grams(ng_length + 1)
  wd_names <-c("w1", "w2", "w3", "w4")
  for(i in 1:ng_length){
    pred_words <- pred_words[ng]
  }
  result_words <- pred_words[order(pred_words$freq, decreasing=T),]
  return(result_words)
}

start_predict <- function(variables) {
  return(load_n_grams(1))
}

load_n_grams <- function(i){
  if(i == 1) {
    return(readRDS("data/unigrams.RDS"))
  }
  if(i == 2) {
    return(readRDS("data/bigrams.RDS"))
  }
  if(i == 3) {
    return(readRDS("data/trigrams.RDS"))
  }
  if(i == 4) {
    return(readRDS("data/quadrigrams.RDS"))
  }
}
wd_names <-c("w1", "w2", "w3", "w4")
eval(wd_names[1])
bb <- a[which(a[[(wd_names[1])]] == "i"),]
