# Use official nginx base image
FROM nginx:alpine

# Remove the default nginx web page
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website into the nginx directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
