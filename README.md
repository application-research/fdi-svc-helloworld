# Hello World NGINX Service Template for FDI Kubernetes


This is a template project that demonstrates how to deploy a simple "Hello, World!" NGINX container to FDI Kubernetes. The NGINX container serves a static HTML file with a "Hello, World!" message.

## Project Structure

The project structure is organized as follows:

```
.
├── Dockerfile
├── index.html
└── kubernetes
    ├── deployment.yaml
    └── service.yaml
```

- `Dockerfile`: Defines the Docker image for the NGINX container.
- `index.html`: Contains the HTML file to be served by NGINX with the "Hello, World!" message.
- `kubernetes`: Directory containing Kubernetes manifests.
  - `deployment.yaml`: Defines the Kubernetes Deployment for the NGINX container.
  - `service.yaml`: Defines the Kubernetes Service for the NGINX container.

## GitHub Actions

This template project includes a GitHub Actions workflow that automates the build, deployment, and continuous integration process. The workflow is defined in the `.github/workflows/main.yml` file.

The workflow performs the following steps:

1. Builds the Docker image using the Dockerfile and pushes it to GitHub Container Registry (ghcr.io).
2. Sets up the Kubernetes environment and deploys the NGINX container to the FDI Kubernetes cluster using the Kubernetes manifests.
3. Triggers the workflow on every push to the `main` branch.

To use GitHub Actions with this template project, make sure you have the following set up:

- Define the necessary secrets in your GitHub repository settings:
  - `KUBECONFIG`: The base64-encoded contents of your Kubernetes cluster's kubeconfig file.

## Getting Started

To deploy the NGINX container to the FDI Kubernetes cluster, follow these steps:

### Prerequisites

- Docker: Install Docker on your local machine.
- Kubernetes: Set up the connection to the FDI Kubernetes cluster and configure kubectl.

### Deployment Steps

1. Clone the repository:

   ```shell
   git clone <repository-url>
   cd fdi-service-template
   ```

2. Build the Docker image:

   ```shell
   docker build -t hello-world-nginx:latest .
   ```

3. Push the Docker image to a container registry accessible by the FDI Kubernetes cluster. For example, you can use GitHub Container Registry (ghcr.io):

   ```shell
   docker tag hello-world-nginx:latest ghcr.io/<username>/hello-world-nginx:latest
   docker login ghcr.io -u <username> -p <personal-access-token>
   docker push ghcr.io/<username>/hello-world-nginx:latest
   ```

   Replace `<username>` with your GitHub username and `<personal-access-token>` with a personal access token that has the appropriate permissions to push to the container registry.

4. Deploy the NGINX container to the Kubernetes cluster:

   ```shell
   kubectl apply -f kubernetes/
   ```

   This will create the necessary Deployments and Services in the FDI Kubernetes cluster.

5. Access the deployed application:

   Once the NGINX container is successfully deployed, you can access the "Hello, World!" message by retrieving the external IP of the Service. Use the following command to get the external IP:

   ```shell
   kubectl get service hello-world-nginx
   ```

   Open a web browser and enter the external IP in the address bar. You should see the "Hello, World!" message displayed.

## Cleaning Up

To clean up and remove the deployed NGINX container from the FDI Kubernetes cluster, run the following command:

```shell
kubectl delete -f kubernetes/
```

This will delete the Deployments and Services associated with the NGINX container.

## Customization

- You can modify the `Dockerfile` to include additional configuration files, directives or image runtimes, based on your service's specific requirements

## Contributing

Feel free to contribute to this template project by opening issues or submitting pull requests. Any improvements or suggestions are welcome!

## License

This template project is licensed under the [MIT License](LICENSE).
``
