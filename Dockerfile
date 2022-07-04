FROM scratch
COPY cockroach/artifacts/cockroach /cockroach
ENTRYPOINT [ "/cockroach" ]