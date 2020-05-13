resource "aws_kms_key" "devops" {
  description         = "kms key decription"
  enable_key_rotation = true
  policy              = data.template_file.pqw.rendered
  tags                = merge(var.tags, map("ApplicationComponent", "kms"))
}
resource "aws_kms_alias" "alias" {
  name          = format("alias/%s", var.key_name)
  target_key_id = aws_kms_key.devops.key_id
}

data "template_file" "pqw" {

  template = length(var.user_policy) > 0 ? var.user_policy : file("${path.module}/policies/kms/kms_share.json.tpl")
  vars = {
    dest_accounts = jsonencode(local.dest_list)
    src_accounts  = jsonencode(local.src_list)
  }
}
