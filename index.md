- {{ site.github.build_revision }}
- {{ site.github.versions.jekyll }}

### example

{{ site.data.example }}
{{ site.data.example[0] }}

{% for e in site.data.example %}
- {{ e }}  
{% endfor %}

### data

{% for e in site.data %}
- {{ e | inspect }}  
{% endfor %}

### normal

{{ site.data.normal | jsonify }}

{% for e in site.data.normal %}
- data: {{ e.data }} - {{ e | jsonify }}  
{% endfor %}

### static_files

{% for p in site.static_files %}
- {{ p.name }}  
{% endfor %}
