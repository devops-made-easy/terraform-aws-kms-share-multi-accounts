locals {
  dest_list_arns   = formatlist("arn:aws:iam::%s:root", var.dest_account_ids)
  source_list_arns = formatlist("arn:aws:iam::%s:root", var.src_account_ids)
  dest_list        = concat(local.dest_list_arns, var.dest_iam_roles)
  src_list         = concat(local.source_list_arns, var.src_iam_roles)
}

variable "tags" {
  default = {
    Owner = "devops"
  }
}
variable "key_name" {}
variable "user_policy" {
  default = ""
}

variable "dest_account_ids" {}
variable "src_account_ids" {}
variable "dest_iam_roles" {
  type    = list(string)
  default = []
}
variable "src_iam_roles" {
  type    = list(string)
  default = []
}


