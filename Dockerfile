FROM python:3.13.2-slim-bullseye

WORKDIR /code

RUN apt-get update && apt-get install -y git

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt && pip install --no-cache-dir pre-commit

COPY ./app /code/app

ADD . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
