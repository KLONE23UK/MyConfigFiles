#!/bin/bash
# NewsAPI

BASEURL='https://newsapi.org/v2/'
COUNTRY='gb'
SOURCE='?id=ign'
APIKEY='02d9e67622ea496ebcee31af916583c7'
GETNEWS=$(curl -s "${BASEURL}top-headlines?country=${COUNTRY}&source${SOURCE}&apiKey=${APIKEY}")

echo $GETNEWS | jq -r '.articles [1] | .title'

