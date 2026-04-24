# Docker Commands — Tamal's Reference Sheet
> Created: April 2026 | Update this as you learn new commands

---

## What is Docker? (in simple words)

Docker lets you run software in an **isolated box** called a container.

- Without Docker: "It works on my machine but not on the server" — common problem
- With Docker: Everything the app needs is packed inside the container — runs the same everywhere

**Real world analogy:**
- **Image** = Recipe (blueprint, instructions)
- **Container** = Dish made from that recipe (the running thing)
- Same recipe → make 100 dishes. Same image → run 100 containers.
- Delete a dish (container) → recipe (image) still exists → make a new one anytime

---

## How Docker runs on your machine

```
Windows
└── WSL2 (Ubuntu)
    └── Docker Engine
        └── Containers (isolated boxes)
            └── ubuntu container
            └── hello-world container
            └── any other container
```

Docker Desktop (Windows app) manages everything. Docker Engine runs inside WSL2.
All data is stored in: `C:\Users\ATRN087\AppData\Local\Docker\wsl\docker-desktop-data.vhdx`

---

## Where data is stored

| Thing | Where it lives |
|-------|---------------|
| Docker images | Inside `.vhdx` file on C: drive |
| Container data | Inside `.vhdx` file on C: drive |
| Files you create inside a container | Inside `.vhdx` file — **deleted when container is removed** |
| Your WSL Ubuntu files | Separate `.vhdx` file |

> ⚠️ **Important:** When you delete a container, everything inside it is gone forever.
> The image stays — you can create a fresh container from it anytime.

---

## Basic Docker Commands

### Images

| Command | What it does | Example |
|---------|-------------|---------|
| `docker images` | List all images on your machine | `docker images` |
| `docker pull imagename` | Download an image from Docker Hub | `docker pull ubuntu` |
| `docker rmi imagename` | Delete an image | `docker rmi hello-world` |

---

### Containers

| Command | What it does | Example |
|---------|-------------|---------|
| `docker run imagename` | Create and run a container from an image | `docker run hello-world` |
| `docker run -it imagename bash` | Run container and go inside it (interactive) | `docker run -it ubuntu bash` |
| `docker ps` | List only **running** containers | `docker ps` |
| `docker ps -a` | List **all** containers (running + stopped) | `docker ps -a` |
| `docker rm containerid` | Delete a stopped container | `docker rm a1e5304d14f6` |
| `docker stop containerid` | Stop a running container | `docker stop a1e5304d14f6` |

---

### Reading `docker ps -a` output

```
CONTAINER ID   IMAGE         COMMAND    CREATED       STATUS                   PORTS     NAMES
a1e5304d14f6   hello-world   "/hello"   2 hours ago   Exited (0) 2 hours ago             nifty_einstein
```

| Column | Meaning |
|--------|---------|
| `CONTAINER ID` | Unique ID — use this to stop/delete |
| `IMAGE` | Which image it was created from |
| `STATUS` | `Exited (0)` = ran and stopped successfully |
| `NAMES` | Docker gives random names automatically |

---

## Container Isolation (important concept)

When you go inside a container and install something:
```bash
docker run -it ubuntu bash
apt-get install curl    ← installed ONLY inside this container
exit                    ← leave container
docker rm <id>          ← delete container → curl is gone forever
```

The container is like a **hotel room** — use it, trash it, get a new one. Your machine is untouched.

---

## `-it` flag explained

`-it` = interactive terminal

| Flag | Meaning |
|------|---------|
| `-i` | Keep input open (you can type) |
| `-t` | Show a terminal (so you see the prompt) |

Without `-it` → container runs and exits immediately.
With `-it` → container stays open so you can work inside it.

---

## Docker Hub

Docker Hub = App Store for Docker images.

Thousands of ready-made images: Ubuntu, Node.js, Python, MySQL, nginx...

When you run `docker run ubuntu` and the image isn't on your machine:
```
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu   ← automatically downloads from Docker Hub
```

---

## Common Mistakes

| Wrong | Correct | Why |
|-------|---------|-----|
| `docker run ubuntu` | `docker run -it ubuntu bash` | Without `-it` the container exits immediately |
| Deleting container to save space | `docker rmi imagename` | Deleting container doesn't free much space — delete the IMAGE |
| `docker ps` | `docker ps -a` | `ps` alone only shows running containers, `-a` shows all |

---

## What's Next to Learn

- [ ] `Dockerfile` — write instructions to build your own custom image
- [ ] `docker build` — build image from Dockerfile
- [ ] `docker-compose` — run multiple containers together
- [ ] Volumes — persist data even after container is deleted
- [ ] Port mapping — access container from browser

---

## Dockerfile — Build Your Own Image

A `Dockerfile` is a text file with instructions to build your own custom image.
Every line is one step. Docker executes them top to bottom.

### Dockerfile Keywords

| Keyword | When it runs | What it does | Example |
|---------|-------------|--------------|---------|
| `FROM` | Build time | Start from a base image | `FROM ubuntu` |
| `RUN` | Build time | Run a command to set up the image | `RUN apt-get install -y curl` |
| `CMD` | Run time | Default command when container starts | `CMD ["curl", "https://api.github.com"]` |

**Key difference:**
- `RUN` = happens while **building** the image (setup, install software)
- `CMD` = happens when you **run** the container (the actual job)

---

### Your First Dockerfile (what you built today)

```dockerfile
FROM curlimages/curl
CMD ["curl", "https://api.github.com"]
```

- Line 1: Start with an image that already has curl installed
- Line 2: When container runs, call the GitHub API

---

### Building and Running Your Image

| Command | What it does | Example |
|---------|-------------|---------|
| `docker build -t name .` | Build image from Dockerfile in current folder | `docker build -t my-first-image .` |
| `docker run imagename` | Run your custom image | `docker run my-first-image` |

> 💡 The `.` at the end of `docker build` means "look for Dockerfile in current folder"

---

### Office Network Note

`archive.ubuntu.com` is blocked by office firewall.
Use `FROM curlimages/curl` or other pre-built images at office.
At home — `FROM ubuntu` + `apt-get install` works fine.

---

### Useful Terminal Shortcut

| Command | What it does |
|---------|-------------|
| `code .` | Open current folder in VS Code |
| `code Dockerfile` | Open specific file in VS Code |

---

## Pushing Your Image to Docker Hub

Docker Hub = public registry where you store and share your images.
Anyone in the world can pull and run your image.

| Command | What it does | Example |
|---------|-------------|---------|
| `docker login` | Login to Docker Hub from terminal | `docker login` |
| `docker tag image username/image` | Tag image with your Docker Hub username | `docker tag my-first-image tamal141/my-first-image` |
| `docker push username/image` | Push image to Docker Hub | `docker push tamal141/my-first-image` |

### Your image is live at:
`hub.docker.com/u/tamal141`

Anyone can run your image with:
```bash
docker run tamal141/my-first-image
```

---

*Add new commands below as you learn them:*

---
