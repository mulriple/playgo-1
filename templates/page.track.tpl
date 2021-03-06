{% extends "mobilebase.tpl" %}

{% block title %}
PlayGo
{% endblock %}

{% block content %}

<ul data-role="listview"  >
    {% for row in m.track[id].tracks %}
    <li>
        <a rel="external" href="{{ row.spotify }}">{{ row.artist }} &mdash; {{ row.track }} at {{ row.ts|date:"H:i" }}</a>
    </li>
    {% endfor %}
</ul>

{% with m.track[id].pos as points %}
{% if points %}

<div id="map" style="width: 100%; height: 500px"></div>

<script>
    new PlayGo({{ m.track[id].tracks|to_json }}, '#map');
</script>
{% else %}

{% button text="Delete this track!!" postback={remove_track id=id} delegate=`playmobil` %}
  
{% endif %}
{% endwith %}

{% wire name="marker_move" postback={marker_move} delegate=`playmobil` %}

<p>
    Created on {{ id.created|date:"j F Y @ H:i" }} by
    <a href="{{ id.creator_id.page_url }}">{{ id.creator_id.title }}</a>
</p>


{% endblock %}
