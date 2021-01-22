FROM  golang:1.8.0-stretch AS buildando
ADD . /app
WORKDIR /app
RUN go build -ldflags="-s -w" -o goapp .

FROM scratch
WORKDIR /app
COPY --from=buildando /app/goapp /app
CMD ["./goapp"]