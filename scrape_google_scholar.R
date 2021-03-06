library(rvest)

gscholar_link <- "https://scholar.google.com/citations?user=Oz3qmlUAAAAJ&hl=en"
readme_loc <- "README.md"

citations <- read_html(gscholar_link) %>%
  html_nodes("#gsc_rsb_st") %>%
  .[[1]] %>%
  html_table() %>%
  .[1, "All"]

readme_txt <- readLines(readme_loc)
readme_txt <- gsub(
  "Scholar-\\d?k?-_.svg",
  sprintf("Scholar-%sk-_.svg", citations ),
  readme_txt)
writeLines(readme_txt, con = readme_loc)
