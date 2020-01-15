variable "hostnames" {
  description = "Hostname of the instance"
  type        = "list"
  default     = ["ADMNY1KDS24"]
}

variable "environment" {
  description = "Environment where infrastructure will be deployed."
  type        = "string"
  default     = "PREPROD"
}

variable "os" {
  description = "OS for the linux instances"
  type        = "string"
  default     = "CENTOS"
}

variable "app_project_tag" {
  description = "Project tag"
  type        = "string"
  default     = "terraform-cicd-prod"
}

variable "aws_instance_type" {
  description = "Project tag"
  type        = "string"
  default     = "t2.micro"
}

variable "aws_key_name" {
  description = "Prefered key name to use"
  type        = "string"
  default     = "terraform-training"
}

variable "aws_subnet" {
  description = "AWS subnet where server will be deployed"
  type        = "string"
  #default     = "subnet-2a04ff71" 
  default     = "primary-gouv-A"
}

variable "aws_account" {
  description = "AWS account to use"
  type        = "string"
  default     = "hpc008-hosting-formation"
}

variable "vpc" {
  description = "VPC where instances will be deployed"
  type        = "string"
  default     = "HPCV3-PRIMARY-PREPROD"
}

variable "vpc_security_group_ids" {
  description = "List of security_group_id to apply on instance."
  type        = "list"
  default     = ["sg-04259c77e6fdea02c"]
}

variable "aws_region" {
  description = "Region to use"
  type        = "string"
  default     = "eu-west-1"
}

variable "foreman_organization" {
  description = "foreman_organization"
  type        = "string"
  default     = "SYS"
}

variable "foreman_hostgroup" {
  description = "foreman_hostgroup"
  type        = "string"
  default     = "puppet_agents"
}

variable "support_group" {
  description = "support_group responsible of the instance"
  type        = "string"
  default     = "CE-TERRAFORM"
}

variable "sacm_owner" {
  description = "sacm_owner for instances"
  type        = "string"
  default     = "KDEFIV03"
}

variable "sacm_costcenter" {
  description = "sacm_costcenter"
  type        = "string"
  default     = "50001Z0095-001"
}
