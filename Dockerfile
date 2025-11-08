FROM debian:trixie-slim

ARG WGET=wget
ARG GIT=git
ARG SSH=openssh-client
ARG MAKE=make
ARG PANDOC=pandoc
ARG PYGMENTS=python3-pygments
ARG PYTHONIS=python-is-python3
ARG FIG2DEV=fig2dev
ARG JRE=default-jre-headless
ARG FONTS=cm-super

RUN apt update && apt install -y apt-utils && apt -y upgrade && apt install -y \
  texlive-full \
  # some auxiliary tools
  "$WGET" \
  "$GIT" \
  "$SSH" \
  "$MAKE" \
  # markup format conversion tool
  "$PANDOC" \
  # XFig utilities
  "$FIG2DEV" \
  # syntax highlighting package
  "$PYGMENTS" \
  # temporary fix for minted, see https://github.com/gpoore/minted/issues/277
  "$PYTHONIS" \
  # Java runtime environment (e.g. for arara)
  "$JRE" \
  # additional latex fonts
  "$FONTS" && \
  # Removing documentation packages *after* installing them is kind of hacky,
  # but it only adds some overhead while building the image.
  apt --purge remove -y .\*-doc$ && \
  # Remove more unnecessary stuff
  apt clean -y
