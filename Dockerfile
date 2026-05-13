FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    openssh-server \
    python3 \
    sudo

RUN mkdir /var/run/sshd

# Create a user ansible can log in as
RUN useradd -m -s /bin/bash ansibleuser && \
    echo "ansibleuser:password" | chpasswd && \
    usermod -aG sudo ansibleuser && \
    echo "ansibleuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
