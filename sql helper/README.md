# SQL HELPER FOR DEBEZIUM

## Installation

### Building the Docker image:

```
docker build -t sqlhelper .
```

**This command builds a Docker image using the Dockerfile in the current directory.
**-t imagename tags the image with the specified name. You can replace imagename with your desired name.

### Running the Docker container:

```
docker run -it --rm -p 4000:4000 sqlhelper
```

This command runs a Docker container based on the specified image.
**-it attaches an interactive terminal to the container so you can see the container's output and interact with it.
**--rm removes the container automatically after it exits.
**-p 8080:8080 maps the host machine's port 8080 to the container's port 8080. You can replace 8080 with any desired port number.
**imagename specifies the name of the image you want to run.
**Make sure to replace **imagename** with the actual image name you used when building the image.

**After running the docker run command, your container should be up and running, and you should be able to access your application on http://localhost:8080 in your web browser.
