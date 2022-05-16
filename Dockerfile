FROM ubuntu:20.04

RUN dpkg --add-architecture i386 \
 && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	tini \
	wine32 winbind \
	libnss3 libatk1.0 libatk-bridge2.0 libgtk-3-common libgbm1 \
	libasound2 xdg-utils \
	breeze-cursor-theme

COPY ./ankama-launcher /

COPY ./entrypoint /
COPY ./entrypoint-unprivileged /
ENTRYPOINT ["tini", "--", "/entrypoint"]
CMD ["./ankama-launcher", "--appimage-extract-and-run", "--no-sandbox"]
