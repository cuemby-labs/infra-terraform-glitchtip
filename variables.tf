#
# GlitchTip variables
#

variable "helm_release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "glitchtip"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "sentry-system"
}

variable "helm_chart_version" {
  description = "The version of the Helm chart."
  type        = string
  default     = "5.0.4"
}

variable "resources" {
  description = "Resource limits and requests for Harbor Helm release."
  type        = map(object({
    limits = object({
      cpu    = string
      memory = string
    })
    requests = object({
      cpu    = string
      memory = string
    })
  }))

  default = {
    web = {
      limits = {
        cpu    = "1000m"
        memory = "512Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "256Mi"
      }
    }
    worker = {
      limits = {
        cpu    = "900m"
        memory = "768Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "350Mi"
      }
    }
    beat = {
      limits = {
        cpu    = "200m"
        memory = "150Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "130Mi"
      }
    }
  }
}

#
# GlitchTip manifest variables
#

variable "secret_key" {
  description = "The secret key for GlitchTip."
  type        = string
  sensitive   = true
}

variable "database_url" {
  description = "Database connection string for GlitchTip."
  type        = string
  sensitive   = true
}

variable "redis_url" {
  description = "Redis connection string for GlitchTip."
  type        = string
  sensitive   = true
}

variable "domain_name" {
  type        = string
  description = "domain name for GlitchTip, e.g. 'dev.domainname.com'"
  default     = "dev.domainname.com"
}

variable "issuer_name" {
  type        = string
  description = "origin issuer name for annotation cert-manager.io/issuer:"
  default     = "origin-ca-issuer"
}

variable "issuer_kind" {
  type        = string
  description = "origin issuer kind for annotation cert-manager.io/issuer-kind:"
  default     = "ClusterOriginIssuer"
}

#
# Walrus Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}