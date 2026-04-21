# Docker Model Runner (DMR) base image
FROM docker/model-runner:latest

# Expose DMR default API port
EXPOSE 8000

# Start the model runner service
ENTRYPOINT ["model-runner", "serve"]
