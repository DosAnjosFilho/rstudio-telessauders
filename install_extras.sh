#!/bin/bash

## build ARGs
NCPUS=${NCPUS:-1}

set -e
apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    default-libmysqlclient-dev \
    libpq-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libxtst6 \
    libcurl4-openssl-dev \
    unixodbc-dev && \
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

## extras
install2.r --error --skipinstalled -r $CRAN -n $NCPUS \
    janitor \
    gtsummary \
    attempt

rm -rf /tmp/downloaded_packages
