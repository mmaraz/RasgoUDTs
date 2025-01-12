{#
Jinja Macro to generate a query that would get all 
the columns in a table by source_Id or fqtn
#}
{%- macro get_source_col_names(source_id=None, source_table_fqtn=None) -%}
    {%- set database, schema, table = '', '', '' -%}
    {%- if source_table_fqtn -%}
        {%- set database, schema, table = source_table_fqtn.split('.') -%}
    {%- else -%}
        {%- set database, schema, table = rasgo_source_ref(source_id).split('.') -%}
    {%- endif -%}
        SELECT COLUMN_NAME FROM {{ database }}.information_schema.columns
        WHERE TABLE_CATALOG = '{{ database|upper }}'
        AND   TABLE_SCHEMA = '{{ schema|upper }}'
        AND   TABLE_NAME = '{{ table|upper }}'
{%- endmacro -%}

{# Get all Columns in Source Table #}
{%- set col_names_source_df = run_query(get_source_col_names(source_table_fqtn=source_table)) -%}
{%- set source_col_names = col_names_source_df['COLUMN_NAME'].to_list() -%}

{# Get all columns in Inputted Source #}
{%- set col_names_other_source_df = run_query(get_source_col_names(source_id=source_id)) -%}
{%- set other_source_col_names = col_names_other_source_df['COLUMN_NAME'].to_list() -%}

{# Get Unique Columns Across Both Datasets #}
{%- set union_cols = source_col_names + other_source_col_names -%}
{%- set union_cols = union_cols | unique | list -%}

{# Generate Union Query #}
SELECT {{ union_cols | join(', ') }} FROM {{ rasgo_source_ref(source_id) }}
UNION {{ 'ALL' if union_all else '' }}
SELECT {{ union_cols | join(', ') }} FROM {{ source_table }}