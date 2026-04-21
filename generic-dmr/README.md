# Local LLM on Kubernetes (DMR Edition)

This project provides a comprehensive setup for running a local Large Language Model (LLM) using **Docker Model Runner (DMR)** and **Open WebUI** on Kubernetes.

## Project Structure

- `docker/`: Dockerfiles for custom image builds.
  - `dmr.Dockerfile`: Base image for the DMR engine.
  - `ui.Dockerfile`: Base image for the Open WebUI frontend.
- `kubernetes/`: Raw Kubernetes YAML manifests for manual deployment.
  - `pvc.yaml`: Persistent storage for models and chat history.
  - `dmr.yaml`: DMR backend deployment and service.
  - `ui.yaml`: Open WebUI frontend deployment and service.

## Prerequisites

- A running Kubernetes cluster (Minikube).
- `kubectl` installed and configured.

## Deployment

1.  **Deploy Storage**:
    ```bash
    kubectl apply -f kubernetes/pvc.yaml
    ```
2.  **Deploy Backend (DMR)**:
    ```bash
    kubectl apply -f kubernetes/dmr.yaml
    ```
3.  **Deploy Frontend (UI)**:
    ```bash
    kubectl apply -f kubernetes/ui.yaml
    ```

## Accessing the UI

Once deployed, you can open the chat interface using:
```bash
minikube service ui
```

## Pulling Models (Manual Step for DMR)

Because Open WebUI's built-in search/download feature is designed for Ollama, you must pull models manually into the DMR backend using the following command:

```bash
# Pull a light model (Qwen 2.5 0.5B) for testing
kubectl exec deploy/dmr -- curl -X POST http://localhost:12434/models/create -d '{"name": "ai/qwen2.5:0.5b"}'
```

Once the command finishes, the model will appear in your Open WebUI model dropdown after a refresh.
