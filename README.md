# serial-logger-phyto-node-ds18b20

## Building the Docker Image
To build the Docker image, run the following command in the project directory (where the `Dockerfile` is located):

```bash
docker build -t serial-temp-logger:latest .
```

## Running the Docker Container
To run the container and dynamically specify `--port` and `--path` arguments, use the following command:

```bash
docker run --name serial-temp-logger-container \
  --restart=always \
  --device=/dev/ttyACM0:/dev/ttyACM0 \
  -v /media/chris/e110508e-b067-4ed5-87a8-5c548bdd8f77:/media/chris/e110508e-b067-4ed5-87a8-5c548bdd8f77 \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  -d \
  serial-temp-logger:latest \
  --port /dev/ttyACM0 --path /media/chris/e110508e-b067-4ed5-87a8-5c548bdd8f77
```

## Explanation
1. `--name serial-temp-logger-container`: Assigns a name to the container (`serial-temp-logger-container`).
2. `--restart=always`: Ensures the container restarts if it crashes.
3. `--device=/dev/ttyACM0:/dev/ttyACM0`: Passes the serial port `/dev/ttyACM0` from the host to the container.
4. `-v /media/chris/e110508e-b067-4ed5-87a8-5c548bdd8f77:/media/chris/e110508e-b067-4ed5-87a8-5c548bdd8f77`: Mounts the host directory for saving output (e.g., CSV files) to the same path inside the container.
5. `-d`: Detached Mode. Docker runs the container in the background, allowing you to continue using the terminal. The container runs as a background process, and you won't see its output in the terminal.
6. <b>Script Arguments</b>
    `--port /dev/ttyACM0`: Specifies the serial port to use. 
    `--path /media/chris/e110508e-b067-4ed5-87a8-5c548bdd8f77`: Sets the directory where the output files will be saved.

## Testing the Setup

1. Check if the container is running:
```bash
    docker ps
```
2. View logs to confirm that the script is running as expected:
```bash
    docker logs -f serial-temp-logger-container
```
