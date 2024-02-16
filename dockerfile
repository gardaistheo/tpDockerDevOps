FROM nginx
WORKDIR /usr/share/nginx/html
COPY . s/usr/share/nginx/html
CMD ["nginx", "-g", "daemon off"]