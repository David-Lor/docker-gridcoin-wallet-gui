ARG GRIDCOIN_VERSION="5.5.1.0"
ARG IMAGE_TAG="debian-13-v4"
ARG ARCH="amd64"

FROM jlesage/baseimage-gui:${IMAGE_TAG}
ARG APP_ICON="https://images.seeklogo.com/logo-png/39/2/gridcoin-grc-logo-png_seeklogo-399512.png"
ENV APP_NAME="Gridcoin Wallet"

RUN install_app_icon.sh "${APP_ICON}"

ARG ARCH
ARG GRIDCOIN_VERSION
ARG GRIDCOIN_DEB="https://github.com/gridcoin-community/Gridcoin-Research/releases/download/${GRIDCOIN_VERSION}/gridcoinresearch-qt_${GRIDCOIN_VERSION}.trixie-1_${ARCH}.deb"
RUN apt-get -yq update && \
    apt-get -yq install curl && \
    curl -L --output /tmp/gridcoin.deb "${GRIDCOIN_DEB}" && \
    apt-get -yq install /tmp/gridcoin.deb systemd- && \
    apt-get -yq purge curl && \
    apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/gridcoin.deb

VOLUME /config
COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh
