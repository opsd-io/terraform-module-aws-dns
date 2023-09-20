# Internal subdomain used for the test environment purpose.

module "test_private_domain" {
  source    = "https://github.com/opsd-io/terraform-module-aws-dns"
  zone_name = "test.opsd.example.int"
}

# Main subdomain used for the intranet purpose.

module "main_private_domain" {
  source = "https://github.com/opsd-io/terraform-module-aws-dns"

  zone_name = "opsd.example.int" # Enter the domain name you want to create here.

  vpc_id     = "vpc-11111111111111111" # Define your VPC ID.
  vpc_region = "eu-central-1"          # Define AWS region that you are operating.

  # Let's create two A records, one for our self-hosted issues and the second for the documentation app.

  a_records = {
    tickets = {
      name    = "issues"
      ttl     = 300
      records = ["192.168.1.200"]
    }
    documentation = {
      name    = "docs"
      ttl     = 300
      records = ["192.168.1.201"]
    }
  }

  # Let's also create two CNAME records that will point to the previously created A records.

  cname_records = {
    tickets = {
      name   = "www.issues"
      ttl    = 300
      record = module.private_domain.a_records["tickets"].fqdn # Use module references to avoid domain copying/pasting.
    }
    documentation = {
      name   = "www.docs"
      ttl    = 300
      record = "docs.opsd.example.int" # If you want to add value explicitly, this is also possible.
    }
  }

  # Next, we will create two subzones for development and testing purposes.

  ns_records = {
    production_zone = {
      name    = module.test_private_domain.zone_name # Subdomain name as reference to test_private_domain module.
      ttl     = 600
      records = module.test_private_domain.name_servers # NS records as reference to test_private_domain module.
    }
    development_zone = {
      name    = "dev" # Subdomain name defined explicitly.
      ttl     = 600
      records = ["ns1.dev.opsd.example.int"] # NS records that we want to define explicitly.
    }
  }

  # We're OldSkool team so we want to use ejabberd as a company messenger.

  srv_records = {
    xmpp = {
      name    = "_xmpp-server._tcp"
      ttl     = 86400
      records = ["5 0 5269 example.int"]
    }
  }

}
