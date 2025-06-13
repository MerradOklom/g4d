FROM hlohaus789/g4f:latest

USER root

WORKDIR /app

EXPOSE 8080

CMD ["sh", "-c", "python -m g4f.cli api --port 8080 --debug"]
