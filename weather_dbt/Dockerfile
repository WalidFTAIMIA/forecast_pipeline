FROM python:3.11-slim

RUN pip install dbt-postgres

WORKDIR /app

COPY . .

CMD ["dbt", "run"]