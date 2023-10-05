# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

#EXPOSE 5000

# Keeps Python from generating .pyc files in the container
#ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
#ENV PYTHONUNBUFFERED=1

# Install pip requirements
# COPY requirements.txt .
# RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY requirements.txt requirements.txt

RUN apt-get update
RUN apt-get -y install gcc
RUN pip3 install -r requirements.txt
COPY . .
ENV FLASK_APP=example4.py


# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
