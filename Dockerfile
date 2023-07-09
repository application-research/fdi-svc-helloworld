# Use the official NGINX image as the base
FROM nginx:latest

# Copy the custom NGINX configuration file
COPY index.html /usr/share/nginx/html/index.html
