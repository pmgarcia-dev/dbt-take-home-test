{# macros/test_expression_is_positive.sql #}
{% macro test_expression_is_positive(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} <= 0
{% endmacro %}
