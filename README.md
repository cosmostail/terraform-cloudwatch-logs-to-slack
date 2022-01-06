## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cw\_log\_group\_name | n/a | `any` | n/a | yes |
| environment | n/a | `string` | `"stg"` | no |
| filter\_pattern | n/a | `string` | `"ERROR"` | no |
| name | n/a | `string` | n/a | yes |
| pager\_duty\_arn | PagerDuty arn | `string` | n/a | yes |
| region | The AWS region in which all resources will be created. | `string` | `"us-east-1"` | no |
| slack\_webhook | n/a | `any` | n/a | yes |
| subnets | n/a | `list(string)` | n/a | yes |
| tags | n/a | `map` | `{}` | no |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

No output.

