variable "zone_name" {
  description = "The main domain name."
  type        = string
}

variable "vpc_id" {
  description = "VPC in which private domain will be created."
  type        = string
  default     = null
}

variable "vpc_region" {
  description = "AWS Region in which private domain will be created."
  type        = string
  default     = null
}

variable "a_records" {
  description = "Domain A records."
  type = map(object({
    name    = string
    ttl     = optional(number, 300)
    records = list(string)
  }))
  default = {}
}

variable "cname_records" {
  description = "Domain CNAME records."
  type = map(object({
    name   = string
    ttl    = optional(number, 600)
    record = string
  }))
  default = {}
}

variable "mx_records" {
  description = "Domain MX records."
  type = map(object({
    name    = string
    ttl     = optional(number, 3600)
    records = list(string)
  }))
  default = {}
}

variable "ns_records" {
  description = "Domain NS records."
  type = map(object({
    name    = string
    ttl     = optional(number, 172800)
    records = list(string)
  }))
  default = {}
}

variable "srv_records" {
  description = "Domain SRV records."
  type = map(object({
    name    = string
    ttl     = optional(number, 3600)
    records = list(string)
  }))
  default = {}
}
