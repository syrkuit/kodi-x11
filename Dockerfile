ARG DEBIAN_TAG=sid

FROM debian:$DEBIAN_TAG

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get dist-upgrade -y && apt-get -y install xinit kodi xsltproc tzdata
#RUN apt-get -y install net-tools

RUN (echo "allowed_users=anybody" ; echo "needs_root_rights=yes") > /etc/X11/Xwrapper.config

ARG KODI_UID=1000
ARG KODI_GID=1000

RUN addgroup --gid $KODI_GID kodi
RUN useradd --uid $KODI_UID --gid $KODI_GID --groups audio --home-dir /kodi --create-home kodi

COPY settings.xsl /root
RUN mv /usr/share/kodi/system/settings/settings.xml /usr/share/kodi/system/settings/settings.bak
RUN xsltproc -o /usr/share/kodi/system/settings/settings.xml /root/settings.xsl /usr/share/kodi/system/settings/settings.bak

EXPOSE 8080 9090 9777/udp

USER kodi
WORKDIR /kodi
ENTRYPOINT [ "/bin/bash" ]
CMD ["-c", "xinit kodi-standalone"]