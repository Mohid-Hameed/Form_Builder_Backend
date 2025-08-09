# Django REST Framework Boilerplate with PostgreSQL (Docker)

This project is a starter template for building REST APIs using Django REST Framework (DRF) with PostgreSQL as the database, running via Docker.

## 🚀 Features
- Django 5.x
- Django REST Framework
- PostgreSQL (Docker)
- Clean `apps/` project structure
- Example `users` app with full CRUD
- Makefile for common commands

## 📂 Project Structure
```
myproject/
│── docker-compose.yml
│── Dockerfile
│── Makefile
│── requirements.txt
│── manage.py
│── myproject/         # Project settings
│── apps/
    └── users/         # Users app (CRUD example)
        ├── migrations/
        ├── models.py
        ├── serializers.py
        ├── views.py
        ├── urls.py
```
---

## 🛠️ Setup Instructions

### 1️⃣ Clone the repository
```bash
git clone https://github.com/yourusername/myproject.git
cd myproject
```

### 2️⃣ Create virtual environment & install dependencies
```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 3️⃣ Start PostgreSQL via Docker
```bash
make db-up
```

### 4️⃣ Run migrations
```bash
make makemigrations
make migrate
```

### 5️⃣ Create superuser
```bash
make createsuperuser
```

### 6️⃣ Run server
```bash
make run
```

Server will be available at: **http://127.0.0.1:8000**

---

## 📡 API Endpoints
| Method | Endpoint        | Description       |
|--------|----------------|------------------|
| GET    | /api/users/    | List all users    |
| POST   | /api/users/    | Create new user   |
| GET    | /api/users/{id}/ | Get user details |
| PUT    | /api/users/{id}/ | Update user      |
| DELETE | /api/users/{id}/ | Delete user      |

---

## 🐳 Docker Commands
```bash
make db-up       # Start PostgreSQL
make db-down     # Stop containers
make db-restart  # Restart PostgreSQL
```

---

## 📜 License
This project is licensed under the MIT License.
