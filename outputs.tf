output "key_arn" {
  value = aws_kms_key.devops.arn
}
output "key_id" {
  value = aws_kms_key.devops.id
}
output "key_alias_id" {
  value = aws_kms_alias.alias.arn
}
output "key_alias_arn" {
  value = aws_kms_alias.alias.target_key_arn
}
output "policy" {
  value = data.template_file.pqw.rendered
}
