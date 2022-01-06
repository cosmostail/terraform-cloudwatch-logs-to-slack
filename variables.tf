variable "vpc_id" {
  type = string
}

variable "name" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "region" {
  description = "The AWS region in which all resources will be created."
  default     = "us-east-1"
  type        = string
}

variable "tags" {
  default = {}
}

variable "slack_webhook" {
}

variable "cw_log_group_name" {
}

variable "filter_pattern" {
  default = "ERROR"
}

