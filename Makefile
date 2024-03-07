# Makefile for Node.js Docker Container

# Variables
DOCKER_IMAGE_NAME = safe_space
DOCKER_CONTAINER_NAME = safe_space_container
# Local folder to track
HOST_DIRECTORY = ./
CONTAINER_DIRECTORY = /safe_space

.PHONY: build run exec stop clean

#Build the docker image
build:
	docker build -t $(DOCKER_IMAGE_NAME) .

# Run the Docker container with the directory binding
run:
	docker run -d --name $(DOCKER_CONTAINER_NAME) --hostname SAFE_SPACE -v $(HOST_DIRECTORY):$(CONTAINER_DIRECTORY) $(DOCKER_IMAGE_NAME)

# Execute a command inside the Docker container
exec:
	docker exec -it $(DOCKER_CONTAINER_NAME) bash

# Stop and remove the Docker container
stop:
	docker stop $(DOCKER_CONTAINER_NAME)
	docker rm $(DOCKER_CONTAINER_NAME)

# Clean up Docker images and containers

clean:
	docker stop $(DOCKER_CONTAINER_NAME) || True
	docker rm $(DOCKER_CONTAINE_NAME) || True
	docker rmi $(DOCKER_IMAGE_NAME) || True

#Run container with "make SAFE" command
