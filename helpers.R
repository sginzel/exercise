#' A method to cache a function call to a file. 
do.cache <- function(FUN, ..., cache.file = "last_call.RData", cache.force = F){
  result = NULL
  if (!file.exists(cache.file) | cache.force){
    cat(sprintf("Caching result to %s...", cache.file))
    result = FUN(...)
    saveRDS(
      object = result, 
      file = cache.file
    )
    cat(sprintf(" -> %s DONE\n", basename(cache.file)))
  } else {
    cat(sprintf("Reading cached result %s...", cache.file))
    result = readRDS(cache.file)
    cat(sprintf("DONE\n"))
  }
  result
}