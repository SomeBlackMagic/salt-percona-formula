{% from "percona/map.jinja" import percona_settings with context %}

include:
  - .repo
  - .config

percona_client:
  pkg.installed:
    - pkgs:
      - {{ percona_settings.client_pkg }}{{ percona_settings.versionstring }}
      - libperconaserverclient20-dev

{% if percona_settings.get('install_toolkit', False) %}
percona_toolkit:
  pkg.installed:
    - name: percona-toolkit
{% endif %}

{% if percona_settings.get('install_utilities', False) %}
mysql_utilities:
  pkg.installed:
    - name: mysql-utilities
{% endif %}
