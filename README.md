Documentation 
1. Project Overview

The AI Meeting Room project is a FastAPI-based web application designed to manage meeting rooms, users, and schedules. It utilizes PostgreSQL as the database and features a robust authentication system. The project architecture follows a modern web application pattern, including containers, components, and deployment configurations.
2. Features

    User Management: Create, read, update, and delete users.
    Authentication: Secure user authentication with hashed passwords.
    Database: PostgreSQL for persistent data storage.
    API Documentation: Auto-generated API documentation using OpenAPI and Swagger.
    Scalable Architecture: Easily scalable with Docker and containerization options.
    Development Tools: Includes configuration for VSCode and Postman for testing.
<img src="assets/estrutura.jpg" alt="Diagrama do Projeto" width="600"/>


3. Installation Guide

This guide will walk you through the setup process for running the AI Meeting Room application locally.
Prerequisites

    Python 3.8 or higher
    PostgreSQL 12 or higher
    Git
    Node.js (for frontend, if applicable)
    Virtual Environment tool (like venv or virtualenv)

Clone the Repository

Start by cloning the repository from GitHub:

bash

git clone https://github.com/acidhubpires/ai-meeting-room.git
cd ai-meeting-room

Backend Setup

    Create and Activate a Virtual Environment

    bash

python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate

Install Backend Dependencies

bash

pip install -r backend/requirements.txt

Configure PostgreSQL

    Ensure PostgreSQL is running.

    Create a database and user:

    sql

CREATE DATABASE ai_meeting_room;
CREATE USER piresaao WITH PASSWORD 'KiaraPanda220';
GRANT ALL PRIVILEGES ON DATABASE ai_meeting_room TO piresaao;

Update the .env file in the backend directory with your database connection details:

ini

    DATABASE_URL=postgresql://piresaao:KiaraPanda220@localhost/ai_meeting_room

Run Database Migrations

    Navigate to the backend directory:

    bash

cd backend

Initialize the database:

bash

    python app/init_db.py

Run the Backend Server

bash

    uvicorn app.main:app --reload

    The backend API should now be running at http://127.0.0.1:8000.

Frontend Setup (Optional)

If your project includes a frontend, follow these steps:

    Navigate to Frontend Directory

    bash

cd frontend

Install Frontend Dependencies

bash

npm install

Run the Frontend Development Server

bash

    npm start

    The frontend application should now be running at http://localhost:3000.

4. Usage
API Endpoints

    Root Endpoint
        GET /: Returns a simple greeting message.

    User Management
        POST /users/: Create a new user.
        GET /users/{user_id}: Retrieve user information.
        PUT /users/{user_id}: Update user information.
        DELETE /users/{user_id}: Delete a user.

Testing the API

Use tools like Postman or Insomnia to test the API. You can import the api-testing.postman_collection.json included in the docs directory for quick setup.
Running Tests

To run the test suite, use:

bash

pytest

This will execute all tests in the project, ensuring that everything works as expected.
5. Deployment
Docker (Optional)

    Build Docker Images

    bash

docker-compose build

Run Docker Containers

bash

    docker-compose up

    This command will start the application using Docker, making it easy to deploy in different environments.

6. Troubleshooting

    Database Connection Issues: Ensure PostgreSQL is running and the credentials in the .env file are correct.
    Dependency Problems: Re-run pip install -r requirements.txt to ensure all packages are installed.
    Port Conflicts: Make sure the ports used by the application are not occupied by other services.

7. Contributing

If you wish to contribute, please follow these guidelines:

    Fork the repository.
    Create a new branch for your feature or bug fix.
    Make your changes and ensure the tests pass.
    Submit a pull request with a detailed description of your changes.

8. License

This project is licensed under the MIT License - see the LICENSE file for details.
9. Contact

For further information, feel free to reach out to the project maintainer:

    Name: Pires, Alexandre André Oliveira / ACIDHUB / GeoToken / ARIADNY
    Email: aaopires@acidhub.com.br
    GitHub: acidhubpires
