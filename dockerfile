FROM alpine:3.19

WORKDIR /app

CMD sh -c "\
  echo 'Hola desde el contenedor 🐳' && \
  echo \"Contenedor: $(hostname)\" > /data/message-from-container.txt && \
  echo \"Fecha: $(date)\" >> /data/message-from-container.txt && \
  sleep 5 \
"