FROM python:3.10-alpine

# Setting environment variables.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the current working directory
WORKDIR /app

# Copy the django project
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set to this working directory
WORKDIR /app/babyshop_app

# Apply pending database migrations && ensure database schema is up to date 
RUN python manage.py migrate

# Expose the port to access app
EXPOSE 8000

# Start the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


