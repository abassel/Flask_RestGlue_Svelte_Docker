
# container_name=frontend
# docker build -t $container_name .                                                  # To build frontend
# docker run --name ${container_name} -p 8080:80 -d --rm ${container_name}           # To run this container
#
# docker logs ${container_name}                                                      # Get output logs
# docker run -it ${container_name} bash                                              # To inspect before stopping
# docker exec -it ${container_name} bash                                             # To inspect while running

# docker system prune --all --force                                                  # Docker clearup

# Refrence
# https://github.com/zupzup/multi-stage-docker-react/blob/main/Dockerfile

FROM node:latest as builder

WORKDIR /opt/front
COPY package.json package-lock.json /opt/front/
RUN npm install
COPY . /opt/front
RUN npm run build

######################
# Production build
######################
FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /opt/front/public /usr/share/nginx/html
EXPOSE 80

#RUN chown nginx.nginx /usr/share/nginx/html/ -R