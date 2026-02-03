ARG IMAGE_TAG="debian-13-v4.10"

FROM jlesage/baseimage-gui:${IMAGE_TAG}
ARG GRIDCOIN_DEB="https://github.com/gridcoin-community/Gridcoin-Research/releases/download/5.4.9.0/gridcoinresearch-qt_5.4.9.0.trixie-1_amd64.deb"
ARG APP_ICON="https://images.seeklogo.com/logo-png/39/2/gridcoin-grc-logo-png_seeklogo-399512.png"
ENV APP_NAME="Gridcoin Wallet"

RUN install_app_icon.sh "${APP_ICON}"

RUN apt-get -yq update && \
    apt-get -yq install curl && \
    curl -L --output /tmp/gridcoin.deb "${GRIDCOIN_DEB}" && \
    apt-get -yq install /tmp/gridcoin.deb && \
    apt-get -yq purge curl && \
    apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/gridcoin.deb

VOLUME /config
COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh
