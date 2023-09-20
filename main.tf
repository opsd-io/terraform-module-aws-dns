# The main domain

resource "aws_route53_zone" "main" {
  name = var.zone_name

  dynamic "vpc" {
    for_each = toset(var.vpc_id != null ? [var.vpc_id] : [])
    content {
      vpc_id     = var.vpc_id
      vpc_region = var.vpc_region
    }
  }
}

resource "aws_route53_record" "a" {
  for_each = var.a_records

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = "A"
  ttl     = each.value.ttl
  records = each.value.records
}

resource "aws_route53_record" "cname" {
  for_each = var.cname_records

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = "CNAME"
  ttl     = each.value.ttl
  records = [each.value.record]
}

resource "aws_route53_record" "mx" {
  for_each = var.mx_records

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = "MX"
  ttl     = each.value.ttl
  records = each.value.records
}

resource "aws_route53_record" "ns" {
  for_each = var.ns_records

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = "NS"
  ttl     = each.value.ttl
  records = each.value.records
}

resource "aws_route53_record" "srv" {
  for_each = var.srv_records

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.name
  type    = "SRV"
  ttl     = each.value.ttl
  records = each.value.records
}
