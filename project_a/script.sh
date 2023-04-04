docker run --name jaffle -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -e POSTGRES_USER=$POSTGRES_USER -e POSTGRES_DB=$POSTGRES_DB -p 5432:5432 -d postgres
docker exec -it jaffle psql -U $POSTGRES_USER -d $POSTGRES_DB
\dt dbt_johnny.*

# check profile & connection
dbt debug

# load initial data
dbt seed

dbt run

dbt test

dbt docs generate
dbt docs serve

brew unlink dbt-postgres@1.2.2 && brew link --overwrite dbt-postgres@1.2.2
brew unlink dbt-bigquery@1.2.0 && brew link --overwrite dbt-bigquery@1.2.0
