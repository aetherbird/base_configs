#!/bin/bash

# generate date string (YYYYMMDD)
today=$(date +%Y%m%d)

brave --app="https://pkm.brushtail.me/$today"
