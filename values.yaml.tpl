hostname: glitchtip.${domain_name}
expose:
  type: ingress
  ingress:
    annotations:
      ingress.kubernetes.io/proxy-body-size: "0"
      ingress.kubernetes.io/ssl-redirect: "true"
      nginx.ingress.kubernetes.io/proxy-body-size: "0"
      nginx.ingress.kubernetes.io/ssl-redirect: "true"
      cert-manager.io/issuer: ${issuer_name}
      cert-manager.io/issuer-kind: ${issuer_kind}
      cert-manager.io/issuer-group: cert-manager.k8s.cloudflare.com
      external-dns.alpha.kubernetes.io/cloudflare-proxied: "true"
    glitchtip:
      annotations:
        external-dns.alpha.kubernetes.io/hostname: glitchtip.${domain_name}
    hosts:
      web: glitchtip.${domain_name}
    className: nginx
  tls:
    enabled: true
    certSource: secret
    secret:
      secretName: "glitchtip-${dash_domain_name}"
externalURL: https://glitchtip.${domain_name}
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