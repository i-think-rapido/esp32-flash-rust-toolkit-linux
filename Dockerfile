FROM rust:latest

# install dependencies
RUN apt update
RUN apt upgrade -y
RUN apt install git python3.11-venv udev libudev-dev -y

# cleanup
RUN apt-get clean autoclean
RUN apt-get autoremove --yes
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/

# install esp toolchain
RUN cargo install espup
RUN espup install
RUN cargo install cargo-espflash
RUN cargo install ldproxy

# final steps
RUN mkdir -p /work/prj
WORKDIR /work

COPY ./main.sh /work/main.sh
RUN chmod u+x /work/main.sh

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
