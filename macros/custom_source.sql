{% macro custom_source(source_name, table_name, s3_path) %}

    {% if target.name == 'duckdb' %}
        {{ s3_path }}
    {% else %}
        {{ source(source_name, table_name) }}
    {% endif %}

{% endmacro %}
