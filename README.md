# Visitor Counter Website

## Introduction

Our Python-based website, designed with Flask technology, offers real-time visitor counts. It is an ideal tool for monitoring site traffic and serves as an excellent educational resource to demonstrate web tracking.

## Features

- Real-time tracking of visitors
- User-friendly interface
- Capacity for additional functionalities

## Installation

### Prerequisites

- Python 3.8 or newer
- Docker
- Docker Compose
- Additional libraries specified in `requirements.txt`

## Steps to Setup and Run the Application

1. **Clone the Repository and Access the Project Directory:**
```
git clone https://github.com/Saadovich/Web-CountVistors && cd Web-CountVistors
```
2. **Understand the Application's Components:**
- The `app.py` is a Python Flask application that counts visitor hits with Redis.
- The `Dockerfile` prepares the Python environment and installs dependencies listed in `requirements.txt`.
- The `docker-compose.yml` orchestrates the setup of the Flask application and Redis service.

3. **Check the `requirements.txt` File:**
This file should list Flask and Redis, ensuring these Python packages are installed within the Docker environment.

4. **Launch the Containers:**
Use Docker Compose to build and start the application and Redis containers:
```
docker-compose up --build -d 
```
This command will pull the necessary Docker images, build the application's Docker image, and start both the application and Redis containers as defined in `docker-compose.yml`.

5. **Access the Application:**
Once the containers are up, the Flask application will be accessible at:
- Local: [http://localhost:9000/](http://localhost:9000/)
- External: [http://3.145.55.53:9000/](http://3.145.55.53:9000/)

You will see a message indicating the number of times the page has been viewed.

### Troubleshooting

If you encounter issues with the connection between the Flask application and Redis, ensure the services are correctly defined and linked in your `docker-compose.yml`. The Redis host in your Flask application should be set to the service name defined for Redis in the Docker Compose file.

## How It Works

The application accurately tracks unique and returning visitors using an efficient mechanism.

## Contributing

We welcome contributions! For guidelines on submitting pull requests and reporting issues, please review our CONTRIBUTING.md document.

## License

Refer to the LICENSE file for details on the license type.

## Contact
Should you have any questions or wish to report an issue, please do not hesitate to use the GitHub issue tracker or contact us directly at [A.saadovich@hotmail.com].

## Acknowledgements
We extend our gratitude to all the resources, tutorials, and contributors that have made this project possible.
- [Resources, tutorials, contributors]
