FROM python:3.14-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
	gcc \
	libc-dev \
	&& rm -rf /var/lib/apt/lists/*

ADD . /
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m pip install --editable .

EXPOSE 9181

ENTRYPOINT ["python", "-m", "rq_dashboard"]
