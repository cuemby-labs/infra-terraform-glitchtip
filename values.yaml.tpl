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
    DEFAULT_FROM_EMAIL: ${DEFAULT_FROM_EMAIL}
    
    # MinIO Configuration for File Storage
    DEFAULT_FILE_STORAGE: {DEFAULT_FILE_STORAGE}
    AWS_ACCESS_KEY_ID: {AWS_ACCESS_KEY_ID}
    AWS_SECRET_ACCESS_KEY: {AWS_SECRET_ACCESS_KEY}
    AWS_STORAGE_BUCKET_NAME: {AWS_STORAGE_BUCKET_NAME}
    AWS_S3_ENDPOINT_URL: {AWS_S3_ENDPOINT_URL}

postgresql:
  enabled: ${postgresql}
  auth:
    postgresPassword: ${postgres_pass}