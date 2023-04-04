{%- macro remove_stale_models(schema=target.schema) -%}
  {%- set tables_to_drop = [] -%}
  {%- set relations = dbt_utils.get_relations_by_pattern(
    schema_pattern=schema, table_pattern="%") -%}
  {%- set table_names = [] -%}
  {{ dbt_utils.log_info("Relations: " ~ relations) }}

  with last_modified as (
    select table_name, last_modified_time from `{{ target.database }}.{{schema}}.INFORMATION_SCHEMA.PARTITIONS`
    where table_name in (
    {% for rel in relations -%}
      "{{ rel.identifier }}"{{ ", " if not loop.last }}
    {% endfor %}
    )
  )

  select * from last_modified
{% endmacro %}






