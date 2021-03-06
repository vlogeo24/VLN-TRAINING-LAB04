module "hosting_aws_instance_v1" {
  source                 = "git::http://terraformer:decathlon@gitlab.hosting.eu/terraformers/hosting_aws_instance_all_in_one.git?ref=v2.0.0"
  hostnames              = "${var.hostnames}"
  environment            = "${var.environment}"
  os                     = "${var.os}"
  app_project_tag        = "${var.app_project_tag}"
  aws_instance_type      = "${var.aws_instance_type}"
  aws_key_name           = "${var.aws_key_name}"
  aws_subnet             = "${var.aws_subnet}"
  aws_account            = "${var.aws_account}"
  vpc                    = "${var.vpc}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  aws_region             = "${var.aws_region}"
  foreman_organization   = "${var.foreman_organization}"
  foreman_hostgroup      = "${var.foreman_hostgroup}"
  support_group          = "${var.support_group}"
  sacm_owner             = "${var.sacm_owner}"
  sacm_costcenter        = "${var.sacm_costcenter}"
}
