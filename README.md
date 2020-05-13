# *Terraform-aws-kms-share-multi-accounts*
module to create custom kms key and share access to multiple AWS accounts with option to add  particular IAM Roles and Users
## Sample way of using this module
> There are 2 ways to use this module.

1. Using default policy to create kms key and share to dest accounts

```
module "kms_sharing" {
  source           = "git@github.com:devops-made-easy/terraform-aws-kms-share-multi-accounts.git"
  version          = "1.0.0"
  key_name         = "devops-key-sharing"
  dest_account_ids = ["1111111", "222222", "333333"]
  dest_iam_roles   = ["arn:aws:iam::xxxxxx:role/dest_iam_role"](optional)
  src_account_ids  = ["444444"]
  src_iam_roles   = ["arn:aws:iam::xxxxxx:role/src_iam_role"](optional)
}
```
2. Using Custom policy provided to this module 
```
module "kms_sharing" {
  source           = "git@github.com:devops-made-easy/terraform-aws-kms-share-multi-accounts.git"
  version          = "1.0.0"
  key_name         = "devops-key-sharing"
  dest_account_ids = ["1111111", "222222", "333333"]
  dest_iam_roles   = ["arn:aws:iam::xxxxxx:role/dest_iam_role"](optional)
  src_account_ids  = ["444444"]
  src_iam_roles   = ["arn:aws:iam::xxxxxx:role/src_iam_role"](optional)
  user_policy      = file("${path.module}/xxxx.json.tpl")(optional)
}
```
