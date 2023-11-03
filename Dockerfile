FROM rust:latest

# install dependencies
RUN apt update
RUN apt upgrade -y
RUN apt install udev libudev-dev -y

# cleanup
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

# install esp toolchain
RUN cargo install espup
RUN espup install
RUN cargo install cargo-espflash

# final steps
RUN mkdir /prj
WORKDIR /prj

ENTRYPOINT [ "tail", "-f", "/dev/null" ]