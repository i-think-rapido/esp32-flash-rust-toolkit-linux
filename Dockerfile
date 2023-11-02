FROM rust:latest

RUN cargo install espup
RUN espup install

RUN mkdir /scripts
RUN cp ~/export-esp.sh /scripts

RUN mkdir /prj
WORKDIR /prj

ENTRYPOINT [ "tail", "-f", "/dev/null" ]