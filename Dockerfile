FROM ubuntu:20.04

ARG IPFS_VERSION
ENV IPFS_ARCHIVE=go-ipfs_v${IPFS_VERSION}_linux-amd64.tar.gz
ENV IPFS_ARCHIVE_URL=https://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v$IPFS_VERSION/$IPFS_ARCHIVE \
    IPFS_INSTALL_DIR=/opt/ipfs
ENV PATH=$IPFS_INSTALL_DIR/default/bin:$PATH

RUN \
  apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install \
     wget \
  && wget $IPFS_ARCHIVE_URL \
  && mkdir -p $IPFS_INSTALL_DIR \
  && tar xvf $IPFS_ARCHIVE -C $IPFS_INSTALL_DIR \
  && rm -f $IPFS_ARCHIVE \
  && ln -s $IPFS_INSTALL_DIR/*ipfs* $IPFS_INSTALL_DIR/default \
  && mkdir $IPFS_INSTALL_DIR/default/bin \
  && mv $IPFS_INSTALL_DIR/default/ipfs $IPFS_INSTALL_DIR/default/bin

COPY entrypoint.sh $IPFS_INSTALL_DIR/default/bin
ENTRYPOINT entrypoint.sh
