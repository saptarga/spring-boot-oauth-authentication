# SPRING BOOT AND OAUTH 2.0 AUTHENTICATION

## Descriptions
Simple project spring boot using OAuth 2.0 Authentication And access token using JWT

## Prerequisites
- Java JDK 8
- Database PostgreSQL
- Maven 

## Installation
Step for installation:
```sh
# Clone this project from gitlab
git clone https://github.com/saptarga/spring-boot-oauth-authentication.git

# Clears the target directory and builds the project
mvn clean install

```

## Configuration
Step for configuration:
- Create new database in postgresql with database name `demo_oauth`.
- Set database name, user, and password in `application.properties`.
- For db migration and seeding data will be created automatically when application running for first time.
- If you want to add new oauth_client_details, you can generate password on https://www.browserling.com/tools/bcrypt

## Run Project
You can start this project using
```sh
mvn clean spring-boot:run
```

## Example Request Rest API
### Generate Password With Grant Type: password
Request
```sh
POST /oauth/token?username=user001&password=teststaff&grant_type=password HTTP/1.1
Host: localhost:8080
Authorization: Basic bW9iaWxlYXBwOmFiY2Q=
```

### Generate Token With Grant Type: client_credentials
Request
```sh
POST /oauth/token?grant_type=client_credentials HTTP/1.1
Host: localhost:8080
Authorization: Basic Y2wtYXBwOjEyMzQ1Njc4OQ==
```

### Get Data Current User
Request 
```sh
GET /api/user HTTP/1.1
Host: localhost:8080
Content-Type: application/json
Accept: application/json
Authorization: {{authToken}}
```

## Client Http
The example above can you try in `Demo OAuth Client.http`

## Author
Created and maintained by saptarga ([@saptarga](https://www.linkedin.com/in/saptarga)).