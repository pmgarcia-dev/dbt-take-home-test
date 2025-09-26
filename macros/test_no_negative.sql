{# macros/test_no_negative.sql #}
{% macro test_no_negative(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} < 0
{% endmacro %}
