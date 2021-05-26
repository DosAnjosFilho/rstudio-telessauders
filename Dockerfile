FROM rocker/geospatial:4.1.0

COPY ./install_extras.sh /rocker_scripts/install_extras.sh
RUN chmod +x /rocker_scripts/install_extras.sh

RUN /rocker_scripts/install_extras.sh
