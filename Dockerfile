FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y vim tightvncserver xfce4 tcsh libglu1-mesa libgomp1 libjpeg62 mesa-utils wget

RUN apt-get remove -y xfce4-panel

#install neurodebian (for datalad)
RUN wget -O- http://neuro.debian.net/lists/stretch.us-nh.libre > /etc/apt/sources.list.d/neurodebian.sources.list
RUN apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

RUN apt install -y connectome-workbench

EXPOSE 5900

ADD virtualgl_2.6_amd64.deb /
RUN dpkg -i /virtualgl_2.6_amd64.deb

ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]


