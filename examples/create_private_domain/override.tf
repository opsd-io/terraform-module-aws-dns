# Make sure we're using working version (from local directory, not git).

module "main_private_domain" {
  source = "./../.."
}

module "test_private_domain" {
  source = "./../.."
}
