# Variables
PYTHON=python
MANAGE=$(PYTHON) manage.py

# Docker
DOCKER_COMPOSE=docker-compose

# Commands
.PHONY: run migrate makemigrations createsuperuser shell db-up db-down db-restart install

# Run Django server
run:
	$(MANAGE) runserver

# Make database migrations
makemigrations:
	$(MANAGE) makemigrations

# Apply migrations
migrate:
	$(MANAGE) migrate

# Create Django superuser
createsuperuser:
	$(MANAGE) createsuperuser

# Django shell
shell:
	$(MANAGE) shell

# Start PostgreSQL container
db-up:
	$(DOCKER_COMPOSE) up -d db

# Stop PostgreSQL container
db-down:
	$(DOCKER_COMPOSE) down

# Restart PostgreSQL container
db-restart:
	$(DOCKER_COMPOSE) down && $(DOCKER_COMPOSE) up -d db

# Install Python dependencies
install:
	pip install -r requirements.txt
