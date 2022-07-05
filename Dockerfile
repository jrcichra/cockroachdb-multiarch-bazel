FROM ubuntu:22.04
WORKDIR /cockroach/
COPY cockroach/artifacts/cockroach /cockroach/cockroach
ENTRYPOINT [ "/cockroach/cockroach" ]
