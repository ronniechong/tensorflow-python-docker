FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN apt-get install git -y
RUN git clone https://github.com/ronniechong/tensorflow-trainer.git /app
WORKDIR /app
RUN mkdir -p /app/uploads
COPY .env /app 
COPY model /app/model 
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "train.py"]