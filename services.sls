redis:
    service.running:
        - enable: true
        - reload: true
        - watch:
            - pkg: redis
