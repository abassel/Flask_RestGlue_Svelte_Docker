#   TO EXECUTE THIS DOCKERFILE:

#   container_name=backend
#   docker build -t $container_name .
#   docker run  --name ${container_name} -p 5000:5000 -d --rm ${container_name}         # To run this container

#   docker logs ${container_name}                                                       # Get output logs
#   docker run -it ${container_name} bash                                               # To inspect before running
#   docker exec -it ${container_name} bash                                              # To inspect while running

# docker system prune --all --force                                                     # Docker clearup

FROM python:3.9.1-slim

# copy project requirement files here to ensure they will be cached.
WORKDIR /opt/app
COPY requirements.lock.txt ./

RUN pip install -r requirements.lock.txt

COPY ./src  ./

EXPOSE 5000

#TODO: Use unicorn
ENTRYPOINT ["python", "app.py"]
