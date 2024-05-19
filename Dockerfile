# Use an official Python runtime as a parent image
FROM python:3.12

LABEL maintainer="HumeraAslam"
# Install Poetry
RUN pip install poetry

# Set the working directory in the container
WORKDIR /code

# Copy the current directory contents into the container at /code
COPY . ./

# COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false 

# Install dependencies including development ones
RUN poetry install 

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the app. CMD can be overridden when starting the container
CMD ["poetry", "run", "uvicorn", "hello-docker.main:app", "--host", "0.0.0.0", "--reload"]