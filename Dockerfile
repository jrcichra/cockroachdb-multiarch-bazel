FROM ubuntu:22.04
COPY cockroach/artifacts/cockroach /cockroach
ENTRYPOINT [ "/cockroach" ]
