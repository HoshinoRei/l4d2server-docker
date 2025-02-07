# l4d2server-docker

## Usage

First, prepare the `server.cfg` file, `host.txt` file and `motd.txt` file.

The `addons` folder is used to store mods and plugins and can be empty.

Run the container by using Docker Compose.

Notice! This is just an example, you should change the path to your own in `volumes`.

```yml
version: "3"
services:
  l4d2server:
    command: "-secure +exec server.cfg +map c1m1_hotel -port 27015"
    container_name: l4d2server
    image: hoshinorei/l4d2server:edge
    # image: ghcr.io/hoshinorei/l4d2server:edge
    ports:
      - 27015:27015
      - 27015:27015/udp
    # You can also use "host" network mode to improve little network performance.
    # network_mode: host
    restart: unless-stopped
    stdin_open: true
    tty: true
    volumes:
      - ./addons/:/home/steam/l4d2server/left4dead2/addons/
      - ./cfg/server.cfg:/home/steam/l4d2server/left4dead2/cfg/server.cfg:ro
      - ./host.txt:/home/steam/l4d2server/left4dead2/host.txt:ro
      - ./motd.txt:/home/steam/l4d2server/left4dead2/motd.txt:ro
```

```bash
sudo docker-compose up -f <your_docker-compose_file_path> -d
```

Enter the game server console.

```bash
sudo docker attach l4d2server
```
