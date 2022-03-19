#!/bin/bash
path=$(dirname "$(realpath -s "$0")")
echo $path
wget https://github.com/Hackl0us/GeoIP2-CN/raw/release/Country.mmdb -O "$path/Country.mmdb"
