library(tidyverse)

# Cities ------------------------------------------------------------------

curl::curl_download('https://simplemaps.com/static/data/us-cities/uscitiesv1.4.csv', destfile = "data/0-raw/uscitiesv1.4.csv")
curl::curl_download('ftp://ftp.ncdc.noaa.gov/pub/data/noaa/isd-history.txt', destfile = "data/0-raw/isd-history.txt")

for (year in 2012:2017) {
  file <- paste0('gsod_',year)
  ftp <- paste0('ftp://ftp.ncdc.noaa.gov/pub/data/gsod/',year,'/',file,'.tar')
  destfile <- paste0('data/0-raw/gsod/',file,'.op.gz')
  curl::curl_download(ftp, destfile)
}

curl::curl_download('https://gist.githubusercontent.com/Miserlou/c5cd8364bf9b2420bb29/raw/2bf258763cdddd704f8ffd3ea9a3e81d25e2c6f6/cities.json', 
                    destfile = "data/0-raw/cities.json")


curl::curl_download('http://www2.census.gov/geo/docs/maps-data/data/gazetteer/2015_Gazetteer/2015_Gaz_cbsa_national.zip', destfile = "data/0-raw/2015_Gaz_cbsa_national.zip")


# https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=PEP_2017_PEPANNRES&prodType=table