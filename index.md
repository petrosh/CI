{{ site.github.build_revision }}

### example
{{ site.data.example }}
{{ site.data.example[0] }}

{% for e in site.data.example %}
- {{ e }}  
{% endfor %}

### normal

{% for e in site.data.normal %}
- data: {{ e.data }} - {{ e | jsonify }}  
{% endfor %}

### static_files

{% for p in site.static_files %}
- {{ p.name }}  
{% endfor %}
