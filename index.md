### OK

{% for e in site.data.example %}
*{{ e }}
*{{ e.data }}
{% endfor %}

{% for p in site.static_files %}
*{{ p.name }}
{% endfor %}
