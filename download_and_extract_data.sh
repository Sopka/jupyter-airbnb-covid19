#!/usr/bin/env bash

set -eu

mkdir -p data

neighbourhoods_geojson_url="http://data.insideairbnb.com/germany/be/berlin/2020-08-30/visualisations/neighbourhoods.geojson"

listings_urls=(
http://data.insideairbnb.com/germany/be/berlin/2020-08-30/data/listings.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-12-11/data/listings.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-12-10/data/listings.csv.gz
)

calendar_urls=(
http://data.insideairbnb.com/germany/be/berlin/2020-01-10/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2020-02-18/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2020-03-17/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2020-04-17/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2020-05-14/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2020-06-13/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2020-08-30/data/calendar.csv.gz

http://data.insideairbnb.com/germany/be/berlin/2019-01-14/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-02-06/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-03-08/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-04-11/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-05-14/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-06-08/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-07-11/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-08-12/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-09-19/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-10-16/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-11-12/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-12-11/data/calendar.csv.gz

http://data.insideairbnb.com/germany/be/berlin/2018-04-12/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-05-14/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-06-09/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-07-10/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-08-14/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-09-12/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-10-10/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-11-07/data/calendar.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-12-10/data/calendar.csv.gz
)

reviews_urls=(
http://data.insideairbnb.com/germany/be/berlin/2020-08-30/data/reviews.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2019-12-11/data/reviews.csv.gz
http://data.insideairbnb.com/germany/be/berlin/2018-12-10/data/reviews.csv.gz
)

function download_and_extract(){
	declare url="$1"
	declare filebasename="$2"
	year=$(echo "$url" | sed -e 's|^http://data.insideairbnb.com/germany/be/berlin/||' |
		sed -e 's|\([^/]*\).*|\1|')
	echo "creating directory for year data/$year"
	mkdir -p "data/$year/unzipped"
	echo "downloading $url"
	curl -L "$url" -o "data/${year}/${filebasename}.csv.gz"
	echo "unzipping data/${year}/${filebasename}.csv.gz"
	gunzip "data/${year}/${filebasename}.csv.gz" -c > "data/${year}/unzipped/${filebasename}.csv"
}

pushd data
curl -L -O "$neighbourhoods_geojson_url"
popd

for url in "${listings_urls[@]}"
do
	download_and_extract "$url" "listings"
done

for url in "${calendar_urls[@]}"
do
	download_and_extract "$url" "calendar"
done

for url in "${reviews_urls[@]}"
do
	download_and_extract "$url" "reviews"
done

echo "unzipped the following calendar files (data/20*/unzipped/calendar*):"
ls -1 data/20*/unzipped/calendar*

