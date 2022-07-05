FROM ubuntu:22.04
WORKDIR /cockroach/
RUN mkdir /cockroach
COPY cockroach/artifacts/cockroach /cockroach/cockroach
ENTRYPOINT [ "/cockroach/cockroach" ]
