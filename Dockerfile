FROM ubuntu:22.04
RUN apt-get update && apt-get -y upgrade && apt-get install -y libc6 ca-certificates tzdata hostname tar && rm -rf /var/lib/apt/lists/*
WORKDIR /cockroach/
COPY cockroach/artifacts/cockroach /cockroach/cockroach
ENTRYPOINT [ "/cockroach/cockroach" ]
