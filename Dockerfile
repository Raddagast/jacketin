FROM ghcr.io/linuxserver/baseimage-alpine:arm64v8-3.13
WORKDIR /app

# set version label
ARG BUILD_DATE
ARG VERSION
ARG SICKGEAR_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="xe, homerr"

# set python to use utf-8 rather than ascii.
ENV PYTHONIOENCODING="UTF-8" \
ENV PORT=8081

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	curl \
	py3-cheetah \
	py3-lxml \
	py3-regex \
	unrar && \
 echo "**** install app ****" && \
 mkdir -p \
	/app/sickgear/ && \
 if [ -z ${SICKGEAR_RELEASE+x} ]; then \
	SICKGEAR_RELEASE=$(curl -sX GET "https://api.github.com/repos/sickgear/sickgear/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \
 curl -o \
	/tmp/sickgear.tar.gz -L \
	"https://github.com/sickgear/sickgear/archive/${SICKGEAR_RELEASE}.tar.gz" && \
 tar xf \
	/tmp/sickgear.tar.gz -C \
	/app/sickgear/ --strip-components=1 && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/root/.cache

CMD exec python3 /app/sickgear/SickBeard.py --datadir /app/config -p $PORT
