FROM python:2.7

WORKDIR /opt/elastalert

RUN wget -O- https://github.com/Yelp/elastalert/archive/v0.1.14.tar.gz \
  | tar -xz --strip-components=1

RUN pip install -r requirements.txt \
 && python ./setup.py install

#RUN pip uninstall elasticsearch -y \
# && pip install elasticsearch==5.5.3
# && pip install "elasticsearch<7"

RUN mkdir -p /etc/elastalert

CMD ["python", "-m", "elastalert.elastalert", "--config", "/etc/elastalert/config.yaml", "--verbose"]
