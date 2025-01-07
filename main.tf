#
# GlitchTip Resources
#

data "kubernetes_namespace" "sentry-system" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_namespace" "sentry-system" {
  metadata {
    name = var.namespace_name
  }
  count = length(data.kubernetes_namespace.sentry-system.id) == 0 ? 1 : 0
}

resource "helm_release" "glitchtip" {
  name       = "glitchtip"
  repository = "https://gitlab.com/api/v4/projects/16325141/packages/helm/stable"
  chart      = "glitchtip"
  version    = var.chart_version
  namespace  = var.namespace_name

  values = [
    templatefile("${path.module}/values.yaml.tpl", {

      glitchtip_domain          = var.domain_name,
      SECRET_KEY                = var.secret_key,
      database_url              = var.database_url,
      redis_url                 = var.redis_url,
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
    })
  ]
}

#
# Walrus Information
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}