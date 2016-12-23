{{ site.github.pages-build-version }}

### example

{% for e in site.data.example %}
*{{ e }}
*{{ e.data }}
{% endfor %}

### normal

{% for e in site.data.normal %}
*{{ e | jsonify }}
*{{ e.data }}
{% endfor %}

### static_files

{% for p in site.static_files %}
*{{ p.name }}
{% endfor %}
