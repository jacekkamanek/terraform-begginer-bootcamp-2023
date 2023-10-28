### Terraform Data Sources

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity

Data Source: aws_caller_identity

Use this data source to get the access to the effective Account ID, User ID, and ARN in which Terraform is authorized.

```json
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
```