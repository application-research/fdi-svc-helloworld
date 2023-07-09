# Build and tag the Docker image
build:
	docker build -t hello-world-nginx:latest .

# Run the Docker container locally
run:
	docker run -p 8080:80 hello-world-nginx

# Apply the Kubernetes manifests
deploy:
	kubectl apply -k kubernetes/dev
deploy-prod:
	kubectl apply -k kubernetes/prod

# Delete the Kubernetes resources
undeploy:
	kubectl delete -k kubernetes/dev
	kubectl delete -k kubernetes/prod

# Clean up the Docker image
clean:
	docker rmi hello-world-nginx:latest

# Shortcut for building, deploying, and running the container locally
all: build deploy run

.PHONY: build run deploy undeploy clean all
