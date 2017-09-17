FROM alpine:3.6

RUN apk add --no-cache \
    ca-certificates \
    python py-pip \
    groff less zip
RUN pip install mkdocs

RUN mkdir /s
WORKDIR /s

CMD ["./build.sh"]