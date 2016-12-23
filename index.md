### example

{% for e in site.data.example %}
*{{ e }}
*{{ e.data }}
{% endfor %}

### normal

{% for e in site.data.normal %}
*{{ e }}
*{{ e.data }}
{% endfor %}

### static_files

{% for p in site.static_files %}
*{{ p.name }}
{% endfor %}
