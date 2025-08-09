# Django REST API Boilerplate with JWT Auth and Custom User

## Features
- Django 5.x
- Django REST Framework
- PostgreSQL (Docker)
- JWT Authentication (djangorestframework-simplejwt)
- Custom User model (email as username, password hashed)
- Full CRUD for users
- Example endpoints for signup, login, user info, and user management

---

## User Model
| Field      | Type      | Description                |
|------------|-----------|----------------------------|
| id         | int       | Primary key                |
| name       | string    | User's name                |
| email      | string    | Unique, used for login     |
| password   | string    | Hashed, never plain text   |
| created_at | datetime  | When user was created      |
| is_active  | bool      | Can login or not           |
| is_staff   | bool      | Admin flag                 |

- **Password**: Always stored hashed using Django's password hasher. Never stored or returned in plain text.
- **Email**: Used as the unique identifier for login.
- **UserManager**: Handles creation of users and superusers, always hashes passwords.

---

## Endpoints

| Method | Endpoint             | Description                | Auth Required |
|--------|----------------------|----------------------------|--------------|
| POST   | /api/signup/         | Register new user          | No           |
| POST   | /api/login/          | Login, get JWT tokens      | No           |
| GET    | /api/me/             | Get current user info      | Yes          |
| PUT    | /api/me/             | Update current user info   | Yes          |
| GET    | /api/users/          | List all users             | Yes          |
| POST   | /api/users/          | Create user (admin)        | Yes          |
| GET    | /api/users/<id>/     | Get user by ID             | Yes          |
| PUT    | /api/users/<id>/     | Update user by ID          | Yes          |
| DELETE | /api/users/<id>/     | Delete user by ID          | Yes          |

---

## Example API Flow

1. **Signup:**
   - `POST /api/signup/` with name, email, password.
   - Receives JWT tokens.

2. **Login:**
   - `POST /api/login/` with email, password.
   - Receives JWT tokens.

3. **Authenticated Requests:**
   - Use `Authorization: Bearer <access_token>` for all `/api/users/` and `/api/me/` endpoints.

4. **Update Info:**
   - `PUT /api/me/` or `PUT /api/users/<id>/` with any fields to update.

5. **Delete:**
   - `DELETE /api/users/<id>/` to remove a user.

---

## Example Curl Commands

### Signup
```
curl -X POST http://localhost:8000/api/signup/ \
  -H "Content-Type: application/json" \
  -d '{"name": "John Doe", "email": "john@example.com", "password": "yourpassword"}'
```

### Login
```
curl -X POST http://localhost:8000/api/login/ \
  -H "Content-Type: application/json" \
  -d '{"email": "john@example.com", "password": "yourpassword"}'
```

### Get User Info
```
curl -X GET http://localhost:8000/api/me/ \
  -H "Authorization: Bearer <access_token>"
```

### Update User Info
```
curl -X PUT http://localhost:8000/api/me/ \
  -H "Authorization: Bearer <access_token>" \
  -H "Content-Type: application/json" \
  -d '{"name": "Jane Doe"}'
```

### List All Users
```
curl -X GET http://localhost:8000/api/users/ \
  -H "Authorization: Bearer <access_token>"
```

### Get User by ID
```
curl -X GET http://localhost:8000/api/users/1/ \
  -H "Authorization: Bearer <access_token>"
```

### Update User by ID
```
curl -X PUT http://localhost:8000/api/users/1/ \
  -H "Authorization: Bearer <access_token>" \
  -H "Content-Type: application/json" \
  -d '{"name": "New Name"}'
```

### Delete User by ID
```
curl -X DELETE http://localhost:8000/api/users/1/ \
  -H "Authorization: Bearer <access_token>"
```

### Refresh JWT Token
```
curl -X POST http://localhost:8000/api/token/refresh/ \
  -H "Content-Type: application/json" \
  -d '{"refresh": "<refresh_token>"}'
```

---

## Security
- Passwords are always hashed.
- JWT tokens are required for all sensitive endpoints.
- Email is unique and used for login.
- All CRUD operations are available and protected.

---

## How User Creation Works
- **Signup**: Accepts `name`, `email`, and `password`. Password is hashed before saving. Returns JWT tokens.
- **UserManager**: Handles creation, always hashes passwords.
- **User Table**: Stores only hashed passwords, never plain text.

---

## How Updates Work
- **PUT** `/api/users/<id>/` or `/api/me/`: You can update any field. Only provided fields are updated. Password, if provided, is hashed before saving. You do **not** need to provide all fields; only those you want to change.

---

## How Deletion Works
- **DELETE** `/api/users/<id>/`: Deletes the user with the given ID (JWT required).

---

## How Listing and Retrieving Works
- **GET** `/api/users/`: Returns a list of all users (JWT required).
- **GET** `/api/users/<id>/`: Returns details for a specific user (JWT required).

---

## Permissions
- Only `/api/signup/` and `/api/login/` are public.
- All other endpoints require a valid JWT access token.
