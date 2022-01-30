FROM archlinux:latest
MAINTAINER uzkodb

USER root
RUN pacman -Syu base-devel --noconfirm
RUN useradd -m user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user
WORKDIR /home/user
RUN sudo pacman -S irssi --noconfirm
RUN curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/autodl-irssi-community.tar.gz
RUN tar -xf autodl-irssi-community.tar.gz
WORKDIR /home/user/autodl-irssi-community
RUN makepkg -s -c --noconfirm autodl-irssi-community.install
RUN sudo pacman -U *pkg.tar.zst --noconfirm

WORKDIR /home/user
RUN curl -L -O https://github.com/autodl-community/autodl-trackers/archive/refs/tags/v284.tar.gz
RUN tar -xvf v284.tar.gz
RUN mv ~/autodl-trackers-284/trackers/ ~/.irssi/scripts/AutodlIrssi/trackers
RUN rm -rf autodl* *tar.gz

RUN mkdir ~/watchdir
RUN mkdir -p ~/.irssi/scripts/autorun
RUN mkdir ~/.autodl
RUN touch ~/.autodl/autodl.cfg
RUN ln -s /usr/share/autodl-irssi/autodl-irssi.pl ~/.irssi/scripts/autorun/autodl-irssi.pl
RUN cp -R /usr/share/autodl-irssi/AutodlIrssi/ ~/.irssi/scripts/

ENV TERM=xterm-256color

