FROM ubuntu:20.04

RUN dpkg --add-architecture i386 \
 && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	tini \
	wine32 winbind \
	libnss3 libatk1.0 libatk-bridge2.0 libgtk-3-common libgbm1 \
	libasound2 xdg-utils \
	breeze-cursor-theme

# TODO: change UID to match host (because of X11 socket)?
#RUN useradd --create-home dofus
#USER dofus

#RUN wget -qO /tmp/dofus https://download.ankama.com/launcher/full/linux/x64 \
# && chmod +x /tmp/dofus
COPY ./ankama-launcher /
#RUN mkdir -p /home/dofus/launcher \
# && cd /home/dofus/launcher \
# && chmod +x /tmp/ankama-launcher \
# && /tmp/ankama-launcher
#RUN chmod +x /home/dofus/ankama-launc

COPY ./entrypoint /
COPY ./entrypoint-unprivileged /
ENTRYPOINT ["tini", "--", "/entrypoint"]
CMD ["/ankama-launcher", "--appimage-extract-and-run", "--no-sandbox"]
