FROM python:3.9.0

RUN pip install --upgrade https://github.com/Kozea/Radicale/archive/3.0.6.tar.gz

RUN useradd --create-home radicale
WORKDIR /home/radicale
USER radicale

COPY config ./config
COPY users ./users
RUN mkdir storage
VOLUME storage

CMD [ "python3", "-m", "radicale", "--config", "/home/radicale/config" ]

EXPOSE 5232/tcp
