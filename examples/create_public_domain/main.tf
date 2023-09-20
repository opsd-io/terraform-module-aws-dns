# Main domain used for the organization purpose.

module "public_domain" {
  source = "https://github.com/opsd-io/terraform-module-aws-dns"

  zone_name = "opsd.example.io" # Enter the domain name you want to create here.

  # Let's create several A records, one for the VPN gateway, second for the office edge router and third for the organization website.

  a_records = {
    vpn_gateway = {
      name    = "vpn"
      ttl     = 300
      records = ["91.90.183.42"]
    }
    office = {
      name    = "office"
      ttl     = 300
      records = ["91.90.183.44"]
    }
    website = {
      name    = ""
      ttl     = 300
      records = ["91.90.183.46"]
    }
  }

  # Let's also create two CNAME records that will point to the previously created A records.

  cname_records = {
    website = {
      name   = "www"
      ttl    = 300
      record = module.public_domain.a_records["website"].fqdn # Use module references to avoid domain copying/pasting.
    }
  }

  # Finally, add MX records for the GMAIL (email server).

  mx_records = {
    gmail = {
      name    = ""
      ttl     = 3600
      records = ["1 ASPMX.L.GOOGLE.COM", "5 ALT1.ASPMX.L.GOOGLE.COM", "5 ALT2.ASPMX.L.GOOGLE.COM", "10 ALT3.ASPMX.L.GOOGLE.COM", "10 ALT4.ASPMX.L.GOOGLE.COM"]
    }
  }
}
