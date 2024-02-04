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

### Steps to Setup and Run the Application

1. **Clone the Repository:** Use `git clone <https://github.com/Saadovich/Web-CountVistors`> to clone the repository.
2. **Access Project Directory:** Navigate to the project directory using `cd Web-CountVistors`.
3. **Understand the Application's Code:** The main application is a Python Flask app (`app.py`) that interacts with a Redis instance to count hits. The `Dockerfile` sets up the Python environment and installs dependencies from `requirements.txt`.
4. **Checking the `requirements.txt` File:** This file lists the necessary Python packages, including Flask and Redis.
5. **Launch the Containers:** Use Docker Compose to build and start the containers with `docker-compose up --build`. This command pulls the necessary images, builds the application image, and starts the containers.
6. **Access the Application:** Once the containers are running, access the Flask application at `http://localhost:9000/` or `http://3.145.55.53:9000/` where you'll see a message indicating the number of times the page has been viewed.

### Troubleshooting

If you encounter issues with the connection between the Flask application and Redis, ensure the services are correctly defined and linked in your `docker-compose.yml`. The Redis host in your Flask application should be set to the service name defined for Redis in the Docker Compose file.

### Running the Application

Start the web server with `docker-compose up -d` and visit `http://localhost:9000/` or `http://3.145.55.53:9000/` in your browser.

## How It Works

The application accurately tracks unique and returning visitors using an efficient mechanism.

## Contributing

We welcome contributions! For guidelines on submitting pull requests and reporting issues, please review our CONTRIBUTING.md document.

## License

Refer to the LICENSE file for details on the license type.

## Contact

For inquiries, please use the GitHub issue tracker or contact [A.saadovich@hotmail.com].

## Acknowledgements

- [Resources, tutorials, contributors]
