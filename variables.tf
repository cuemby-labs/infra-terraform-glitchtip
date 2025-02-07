#
# GlitchTip variables
#

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "sentry-system"
}

variable "chart_version" {
  description = "The version of the Helm chart."
  type        = string
  default     = "5.0.4"
}

variable "resources" {
  description = "Resource limits and requests for GlitchTip Helm release."
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
        memory = "1024Mi"
      }
      requests = {
        cpu    = "500m"
        memory = "512Mi"
      }
    }
    worker = {
      limits = {
        cpu    = "900m"
        memory = "1024Mi"
      }
      requests = {
        cpu    = "450m"
        memory = "512Mi"
      }
    }
    beat = {
      limits = {
        cpu    = "400m"
        memory = "512Mi"
      }
      requests = {
        cpu    = "200m"
        memory = "256Mi"
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
  default     = "default-secret-key"
  sensitive   = true
}

variable "database_url" {
  description = "Database connection string for GlitchTip."
  type        = string
  default     = "postgres://default-user:default-pass@localhost:5432/default-db"
  sensitive   = true
}

variable "enable_postgres" {
  description = "Enable postgresql"
  type        = bool
  default     = "false"
}

variable "postgres_pass" {
  description = "Password for postgres"
  type        = string
  sensitive   = true
  default     = "default-password"
}

variable "redis_url" {
  description = "Redis connection string for GlitchTip."
  type        = string
  default     = "redis://localhost:6379"
  sensitive   = true
}

variable "email_url" {
  description = "Email URL"
  type        = string
  default     = "smtp://resend:API_KEY@smtp.resend.com:465"
  sensitive   = true
}

variable "emailfrom_url" {
  description = "Email FROM URL"
  type        = string
  default     = "rd@cuemby.com"
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