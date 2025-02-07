web:
  resources:
    limits:
      cpu: ${web_limits_cpu}
      memory: ${web_limits_memory}
    requests:
      cpu: ${web_request_cpu}
      memory: ${web_request_memory}
worker:
  resources:
    limits:
      cpu: ${worker_limits_cpu}
      memory: ${worker_limits_memory}
    requests:
      cpu: ${worker_request_cpu}
      memory: ${worker_request_memory}
beat:
  resources:
    limits:
      cpu: ${beat_limits_cpu}
      memory: ${beat_limits_memory}
    requests:
      cpu: ${beat_request_cpu}
      memory: ${beat_request_memory}
env:
  normal:
    GLITCHTIP_DOMAIN: https://glitchtip.${domain_name}
  secret:
    SECRET_KEY: ${SECRET_KEY}
    DATABASE_URL: ${DATABASE_URL}
    REDIS_URL: ${REDIS_URL}
    EMAIL_URL: ${EMAIL_URL}
    DEFAULT_FROM_EMAIL: ${EMAILFROM_URL}

postgresql:
  enabled: ${postgresql}
  auth:
    postgresPassword: ${postgres_pass}