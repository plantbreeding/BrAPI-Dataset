# https://hub.docker.com/r/thajeztah/pgadmin4/
FROM thajeztah/pgadmin4

USER root
RUN apk update && apk add postgresql
USER pgadmin:pgadmin

CMD /brapi-dataset/docker/pgadmin/container-init.sh
