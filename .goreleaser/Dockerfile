FROM busybox:glibc

WORKDIR /app

COPY sendgrid_exporter /bin/

ENTRYPOINT ["/bin/sendgrid_exporter"]
