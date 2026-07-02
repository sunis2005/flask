# Flask Application Docker Deployment

## Project Overview

This project demonstrates containerization and deployment of a Flask application using Docker.

The application was prepared for deployment in a development environment as part of the DevOps internship task.

---

## Project Structure

```text
examples/tutorial/
├── flaskr/
├── tests/
├── requirements.txt
├── Dockerfile
├── deploy.sh
└── README.md
```

---

## Application Details

| Item                    | Value                |
| ----------------------- | -------------------- |
| Application Entry Point | `flaskr/__init__.py` |
| Dependency File         | `pyproject.toml`     |
| Default Port            | `5000`               |

---

## Prerequisites

* Git
* Docker Desktop
* Ubuntu WSL / Linux Terminal

---

## Clone Repository

```bash
git clone https://github.com/sunis2005/flask.git
cd flask/examples/tutorial
```

---

## Build Docker Image

```bash
docker build -t omega/flask-tutorial:v1 .
```

---

## Run Docker Container

```bash
docker run -d -p 5000:5000 --name omega-flask omega/flask-tutorial:v1
```

---

## Initialize Database

```bash
docker exec -it omega-flask flask --app flaskr init-db
```

---

## Access Application

Open browser:

```text
http://localhost:5000
```

---

## Deployment Automation

Run deployment script:

```bash
./deploy.sh
```

---

## Challenges Faced

| Challenge                    | Solution                                  |
| ---------------------------- | ----------------------------------------- |
| Git not installed            | Installed Git in Ubuntu                   |
| Docker permission denied     | Added user to docker group                |
| Docker WSL integration issue | Enabled WSL integration in Docker Desktop |
| Internal Server Error        | Initialized Flask database                |

---

## Author

Suni
