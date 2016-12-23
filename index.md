{{ site.github.build_revision }}

### example
{{ site.data.example | inspect }}

{% for e in site.data.example %}
- data: {{ e.data }} - {{ e }}
{% endfor %}

### normal

{% for e in site.data.normal %}
- data: {{ e.data }} - {{ e | jsonify }}
{% endfor %}

### static_files

{% for p in site.static_files %}
- {{ p.name }}
{% endfor %}
