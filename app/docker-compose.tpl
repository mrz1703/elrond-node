version: '3.7'

x-custom:
  # Templates anchors
  build_env: &build_env
    ELROND_VERSION: {{ elrondVersion }}
    CONFIG_VERSION: {{ configVersion }}

  app_tmp: &app_tmp
    restart: always
    build:
      context: ./.build/
      args:
        <<: *build_env
        WORKING_DIR_NODE: {{ workingDirNode }}

services:
{% for num in range(nodesDisplayName | length) %}
  elrond-{{num + 1}}:
    <<: *app_tmp
    container_name: elrond-{{num + 1}}
    volumes:
      - ./data/elrond-{{num + 1}}/:{{ workingDirNode }}/user_keys/
      - elrond-{{num + 1}}:{{ workingDirNode }}/db/
    environment:
      DISPLAY_NAME: {{nodesDisplayName[num]}}
      WORKING_DIR_NODE: {{ workingDirNode }}
{% endfor %}

volumes:
  {%- for num in range(nodesDisplayName | length) %}
  elrond-{{num + 1}}:
  {%- endfor %}

