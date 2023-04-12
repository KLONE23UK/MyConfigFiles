#!/bin/bash
# NewsAPI

BASEURL='https://newsapi.org/v2/'
COUNTRY='gb'
APIKEY='02d9e67622ea496ebcee31af916583c7'
CATAGORY='general'
GETNEWS=$(curl -s "${BASEURL}top-headlines?country=${COUNTRY}&catagory=${CATAGORY}&apiKey=${APIKEY}")
echo -e "${BASEURL}top-headlines?country=${COUNTRY}&catagory=${CATAGORY}&apiKey=${APIKEY}"

echo $GETNEWS | jq -r '.articles [1] | .title'

