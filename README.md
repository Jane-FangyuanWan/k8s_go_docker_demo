# Go + Docker + Kubernetes Demo

This project demonstrates how to:

- Build a simple web server using **Go**
- Containerize the application using **Docker**
- Deploy the container to **Kubernetes** using **Minikube**
- Expose the service using a **NodePort**
- Access the application via browser or `curl`

---

## 📦 Project Structure

```
go-docker-demo/
├── Dockerfile           # Docker multi-stage build file
├── go-deploy.yaml       # Kubernetes Deployment + Service
├── go.mod               # Go module file
├── main.go              # Go source code (simple HTTP server)
├── .gitignore           # Common ignore rules for Go + Docker
└── README.md            # You're reading it!
```

---

## 🚀 Getting Started

### 🔨 Prerequisites

- Go installed (`brew install go`)
- Docker installed (`https://www.docker.com/products/docker-desktop`)
- Minikube installed (`brew install minikube`)
- kubectl installed (`brew install kubectl`)

---

### 🛠️ Build and Run Locally (Docker only)

```bash
docker build -t go-docker-demo .
docker run -p 8080:8080 go-docker-demo
```

Visit your browser: [http://localhost:8080](http://localhost:8080)

---

### ☁️ Run on Kubernetes (Minikube)

#### Step 1: Start Minikube

```bash
minikube start
```

#### Step 2: Use Minikube’s Docker daemon

```bash
eval $(minikube docker-env)
```

#### Step 3: Build the Docker image again (into Minikube's Docker)

```bash
docker build -t go-k8s-demo .
```

#### Step 4: Deploy to Kubernetes

```bash
kubectl apply -f go-deploy.yaml
```

#### Step 5: Check status

```bash
kubectl get pods
kubectl get svc
```

#### Step 6: Access the service

```bash
minikube service go-app-service
```

This opens the browser with a URL like: `http://127.0.0.1:PORT`

---

## 🧠 Explanation of Key Files

### `main.go`

A basic Go web server that listens on port 8080 and returns a simple response.

### `Dockerfile`

Multi-stage build that compiles Go binary in `golang` image and runs it in a small `alpine` container.

### `go-deploy.yaml`

Kubernetes configuration that includes:

- Deployment with 2 replicas
- Service exposing the app on port 80 (forwarded to container's 8080)

---

## 🔐 Security Considerations (Optional for Production)

- Consider using a liveness/readiness probe in your Deployment
- Add resource limits (CPU & memory) for production
- Set up Ingress + TLS if deploying outside Minikube

---

## 👩‍💻 Author

**Fangyuan Wan**  
[@Jane-FangyuanWan](https://github.com/Jane-FangyuanWan)

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
