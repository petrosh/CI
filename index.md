# Try Travis pull

1. activated
1. got push
1. get infos
1. system come in

### Versions

- sha {{ site.github.build_revision }}
- jekyll {{ site.github.versions.jekyll }}

### data

{% for e in site.data %}
- {{ e | inspect }}  
{% endfor %}

### example

{{ site.data.example }}

{% for e in site.data.example %}
- {{ e }}  
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
