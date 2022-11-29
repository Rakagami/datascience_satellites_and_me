#!/bin/bash

wget https://celestrak.org/pub/satcat.csv

CONSTELLATIONS=( starlink oneweb planet iridium gps glonass meteosat intelsat ses telesat orbcomm )

mkdir -p constellations

for i in "${CONSTELLATIONS[@]}"
do
    curl --output constellations/$i.csv "https://celestrak.org/NORAD/elements/supplemental/sup-gp.php?FILE=$i&FORMAT=csv"
    curl --output constellations/$i.xml "https://celestrak.org/NORAD/elements/supplemental/sup-gp.php?FILE=$i&FORMAT=xml"
done
