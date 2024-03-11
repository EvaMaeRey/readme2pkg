#' Title
#'
#' @param chunk_name
#' @param dir
#' @param extension
#' @param file_name
#'
#' @return
#' @export
#'
#' @examples
chunk_to_dir <- function(chunk_name, dir = "R/", extension = ".R"){

    for(i in 1:length(chunk_name)){

  # knitr::knit_code$get(name = chunk_name[i]) |>
  return_chunk_code(chunk_name = chunk_name[i]) |>  
    paste(collapse = "\n") |>
    writeLines(con = paste0(dir,"/",  chunk_name[i], extension))

    }
  
  }
