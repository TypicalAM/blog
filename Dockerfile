FROM golang:1.22.3-alpine3.20 AS builder 

WORKDIR /src
COPY . .
RUN go install github.com/gohugoio/hugo@v0.132.2 && hugo --destination=/site

FROM httpd:alpine3.20
LABEL maintainer="TypicalAM"
COPY --from=builder /site /usr/local/apache2/htdocs
