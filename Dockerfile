FROM python:3.9-slim

# Create a group and user
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Change ownership of the application files
RUN chown -R appuser:appgroup /usr/src/app

# Switch to the new user
USER appuser

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the application
CMD ["python", "app.py"]
