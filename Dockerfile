FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt
#RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y netcat-openbsd

COPY app.py app.py

COPY wait-for-db.sh  app/wait-for-db.sh

RUN chmod +x app/wait-for-db.sh

#ENTRYPOINT ["app/wait-for-db.sh"]
#CMD ["python", "app.py"]
CMD ["sh", "-c", "app/wait-for-db.sh && python app.py"]
