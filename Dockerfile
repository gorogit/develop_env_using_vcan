FROM ubuntu:18.04

#
# base environment
#
RUN apt-get update && \
    apt-get install -y vim less build-essential wget git ncurses-dev bc cmake can-utils iproute2 net-tools


#
# create develop user
#
RUN id develop 2>/dev/null || useradd --uid 30000 --create-home develop
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers
USER develop
WORKDIR  /home/develop

#
# startup command
#
CMD "/bin/bash"
