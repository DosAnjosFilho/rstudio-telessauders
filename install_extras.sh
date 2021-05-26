#!/bin/bash

## build ARGs
NCPUS=${NCPUS:-1}

set -e
apt-get update -qq && apt-get -y --no-install-recommends install \
    odbc-postgresql && \
  rm -rf /var/lib/apt/lists/*

## shiny
install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    shiny \
    shinydashboard \
    DT \
    plotly \
    leaflet 

## database
install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    pool \
    odbc
    
## officer
install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    officer \
    mschart \
    flextable

## extras
install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    janitor \
    gtsummary \
    attempt

rm -rf /tmp/downloaded_packages
