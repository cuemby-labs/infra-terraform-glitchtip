#
# GlitchTip Resources
#

resource "kubernetes_namespace" "sentry_system" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "glitchtip" {
  name       = "glitchtip"
  repository = "https://gitlab.com/api/v4/projects/16325141/packages/helm/stable"
  chart      = "glitchtip"
  version    = var.chart_version
  namespace  = var.namespace_name

  values = [
    templatefile("${path.module}/values.yaml.tpl", {

      domain_name               = var.domain_name,
      dash_domain_name          = local.dash_domain_name,
      SECRET_KEY                = var.secret_key,
      DATABASE_URL              = var.database_url,
      REDIS_URL                 = var.redis_url,
      web_request_memory        = var.resources["web"]["requests"]["memory"],
      web_limits_memory         = var.resources["web"]["limits"]["memory"],
      web_request_cpu           = var.resources["web"]["requests"]["cpu"],
      web_limits_cpu            = var.resources["web"]["limits"]["cpu"],
      worker_request_memory     = var.resources["worker"]["requests"]["memory"],
      worker_limits_memory      = var.resources["worker"]["limits"]["memory"],
      worker_request_cpu        = var.resources["worker"]["requests"]["cpu"],
      worker_limits_cpu         = var.resources["worker"]["limits"]["cpu"],
      beat_request_memory       = var.resources["beat"]["requests"]["memory"],
      beat_limits_memory        = var.resources["beat"]["limits"]["memory"],
      beat_request_cpu          = var.resources["beat"]["requests"]["cpu"],
      beat_limits_cpu           = var.resources["beat"]["limits"]["cpu"]
      issuer_name               = var.issuer_name,
      issuer_kind               = var.issuer_kind,
    })
  ]
}

#
# Walrus Information
#

locals {
  context          = var.context
  dash_domain_name = replace(var.domain_name, ".", "-")
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}