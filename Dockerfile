FROM arm64v8/ubuntu:22.04

RUN apt update
ENV TZ 'Europe/London'
env DEBIAN_FRONTEND 'noninteractive'
RUN echo $TZ > /etc/timezone
RUN apt install -yy tzdata curl

RUN curl "https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/15483/download?i_agree_to_tenable_license_agreement=true" --output nessus.deb
RUN dpkg -i nessus.deb

EXPOSE 8834

ENTRYPOINT ["/opt/nessus/sbin/nessus-service"]
