output "zone_id" {
  description = "The ARN of the domain zone."
  value       = aws_route53_zone.main.id
}

output "zone_arn" {
  description = "The ARN of the domain zone."
  value       = aws_route53_zone.main.arn
}

output "zone_name" {
  description = "The Name of the domain zone."
  value       = aws_route53_zone.main.name
}

output "name_servers" {
  description = "The name servers of the domain zone."
  value       = aws_route53_zone.main.name_servers
}

output "a_records" {
  description = "Output for A records"
  value = {
    for key, val in aws_route53_record.a : key => {
      id      = val.id
      ttl     = val.ttl
      type    = val.type
      fqdn    = val.fqdn
      name    = val.name
      records = val.records
    }
  }
}

output "cname_records" {
  description = "Output for CNAME records"
  value = {
    for key, val in aws_route53_record.cname : key => {
      id      = val.id
      ttl     = val.ttl
      type    = val.type
      fqdn    = val.fqdn
      name    = val.name
      records = val.records
    }
  }
}

output "mx_records" {
  description = "Output for MX records"
  value = {
    for key, val in aws_route53_record.mx : key => {
      id      = val.id
      ttl     = val.ttl
      type    = val.type
      fqdn    = val.fqdn
      name    = val.name
      records = val.records
    }
  }
}

output "ns_records" {
  description = "Output for NS records"
  value = {
    for key, val in aws_route53_record.ns : key => {
      id      = val.id
      ttl     = val.ttl
      type    = val.type
      fqdn    = val.fqdn
      name    = val.name
      records = val.records
    }
  }
}

output "srv_records" {
  description = "Output for SRV records"
  value = {
    for key, val in aws_route53_record.srv : key => {
      id      = val.id
      ttl     = val.ttl
      type    = val.type
      fqdn    = val.fqdn
      name    = val.name
      records = val.records
    }
  }
}
