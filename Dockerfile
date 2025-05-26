# Use a small nginx image to serve the static site
FROM nginx:alpine

# Clean default NGINX files
RUN rm -rf /usr/share/nginx/html/*

# Copy static files to nginx public folder
COPY build/ /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Run NGINX
CMD ["nginx", "-g", "daemon off;"]

