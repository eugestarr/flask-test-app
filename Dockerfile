# Start by specifying our base image, using the FROM keyword
FROM alpine:3.5

# Install the Python pip package to the alpine linux distribution
RUN apk add --update py2-pip

# Install all Python requirements for our app to run
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Specify the port number which needs to be exposed
EXPOSE 5000

# Command for running the application
CMD ["python", "/usr/src/app/app.py"]