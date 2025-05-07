#FROM python:3.11-slim

#WORKDIR /app

#COPY converter.py requirements.txt example.csv ./

#RUN pip install --no-cache-dir -r requirements.txt

#CMD ["python3", "converter.py", "-i", "example.csv", "-o", "example.json"]

FROM python:3.11-slim

WORKDIR /app

COPY converter.py example.csv run.sh requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]