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
