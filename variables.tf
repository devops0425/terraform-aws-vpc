variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  type        = string
  description = "dev, stage, or prod"
}

variable "azs" {
  type        = list(string)
  description = "List of Availability Zones"
}

variable "private_subnets" {
  type        = list(string)
}

variable "public_subnets" {
  type        = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}