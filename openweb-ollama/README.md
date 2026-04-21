# Local LLM on Kubernetes (Ollama Edition)

This project provides a comprehensive setup for running a local Large Language Model (LLM) using **Ollama** and **Open WebUI** on Kubernetes.

## Project Structure

- `docker/`: Dockerfiles for components.
  - `ollama.Dockerfile`: Base image for the Ollama engine.
  - `webui.Dockerfile`: Base image for the Open WebUI frontend.
- `kubernetes/`: Raw Kubernetes YAML manifests for manual deployment.
  - `pvc.yaml`: Persistent storage for models and WebUI data.
  - `ollama.yaml`: Ollama backend deployment and service.
  - `ui.yaml`: Open WebUI frontend deployment and service.
- `helm/`: Helm chart for automated deployment.

## Prerequisites

- A running Kubernetes cluster (Minikube).
- `kubectl` and `helm` installed and configured.

## Deployment (Manual)

1.  **Deploy Storage**:
    ```bash
    kubectl apply -f kubernetes/pvc.yaml
    ```
2.  **Deploy Backend (Ollama)**:
    ```bash
    kubectl apply -f kubernetes/ollama.yaml
    ```
3.  **Deploy Frontend (Open WebUI)**:
    ```bash
    kubectl apply -f kubernetes/ui.yaml
    ```

## Deployment (Helm)

```bash
helm install ollama-stack ./helm
```

## Accessing the UI

Once deployed, you can open the chat interface using:
```bash
minikube service ui
```

## Automatic Model Pulling

This setup includes a sidecar container in the Ollama deployment that automatically pulls the `smollm2:135M` model on startup. You can change the default model by updating the `MODEL_NAME` environment variable in `ollama.yaml` or the `model.name` value in `values.yaml`.
