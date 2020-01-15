### Providers config for hosting_aws_all_in_one module ###
### cloud provider AWS with VAULT usage                ###
### version 1.0.0                                      ###


locals {
  vault_environment = "${lower(substr(var.environment, 0,3)) == "pre" ? "preprod" : "production"}"
}

provider "vault" {}

####################
# Foreman Provider #
####################
data "vault_generic_secret" "foreman" {
  path = "secret/foreman/${local.vault_environment}"
}

provider "foreman" {
  url      = "${data.vault_generic_secret.foreman.data["url"]}"
  username = "${data.vault_generic_secret.foreman.data["username"]}"
  password = "${data.vault_generic_secret.foreman.data["password"]}"
}

####################
# AWS Requirements #
####################
data "vault_generic_secret" "aws_key" {
  path = "secret/aws/${var.aws_account}-${var.aws_region}"
}
provider "aws" {
  access_key = "${replace(base64decode(data.vault_generic_secret.aws_key.data["access_key"]),"\n","")}"
  secret_key = "${replace(base64decode(data.vault_generic_secret.aws_key.data["secret_key"]),"\n","")}"
  region     = "${var.aws_region}"
  version    = "~> 2.3"
}

###################
# Wallix Provider #
###################

data "vault_generic_secret" "wallix" {
  path = "secret/wallix/aws/${local.vault_environment}/${var.aws_region}"
}

provider "wab" {
  base_url = "${data.vault_generic_secret.wallix.data["base_url"]}"
  api_user = "${data.vault_generic_secret.wallix.data["api_user"]}"
  api_key  = "${data.vault_generic_secret.wallix.data["api_key"]}"
  timeout  = "180"
}

#####################
# Centreon Provider #
#####################

data "vault_generic_secret" "centreon" {
  path = "secret/centreon/${local.vault_environment}"
}

provider "centreon" {
  endpoint = "${data.vault_generic_secret.centreon.data["endpoint"]}"
  token    = "${data.vault_generic_secret.centreon.data["token"]}"
}

##################
# HPSAW Provider #
##################
data "vault_generic_secret" "hpsaw" {
  path = "secret/hpsaw/${local.vault_environment}"
}

provider "hpsaw" {
  api_key  = "${data.vault_generic_secret.hpsaw.data["api_key"]}"
  endpoint = "${data.vault_generic_secret.hpsaw.data["api_endpoint"]}"
}

#########################
# DNS Prod Requirements #
#########################

data "vault_generic_secret" "dns_prod" {
  path = "secret/dns/prod/aws/${var.aws_region}"
}

provider "dns" {
  alias = "prod"

  update {
    server        = "${data.vault_generic_secret.dns_prod.data["dktinfradns"]}"
    key_name      = "${data.vault_generic_secret.dns_prod.data["dns_a_key_name"]}"
    key_secret    = "${data.vault_generic_secret.dns_prod.data["dns_a_key_secret"]}"
    key_algorithm = "${data.vault_generic_secret.dns_prod.data["dns_a_key_algo"]}"
  }
}

############################
# DNS Preprod Requirements #
############################

data "vault_generic_secret" "dns_preprod" {
  path = "secret/dns/preprod/aws/${var.aws_region}"
}

provider "dns" {
  alias = "preprod"

  update {
    server        = "${data.vault_generic_secret.dns_preprod.data["dktinfradns"]}"
    key_name      = "${data.vault_generic_secret.dns_preprod.data["dns_a_key_name"]}"
    key_secret    = "${data.vault_generic_secret.dns_preprod.data["dns_a_key_secret"]}"
    key_algorithm = "${data.vault_generic_secret.dns_preprod.data["dns_a_key_algo"]}"
  }
}
