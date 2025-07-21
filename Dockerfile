# base image
FROM python:3.11-slim

# set working directory
WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project files
COPY . .

# run server
CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]
