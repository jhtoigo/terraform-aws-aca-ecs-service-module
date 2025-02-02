# terraform-aws-aca-ecs-service-module
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule) | resource |
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_appautoscaling_policy.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_requests](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.service_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.service_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_alb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/alb) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_arn"></a> [alb\_arn](#input\_alb\_arn) | ARN of the Application Load Balancer for request-based scaling | `string` | `null` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | List of additional capabilities required for the task | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS cluster where the service will be deployed | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Image with tag for deploying the application to ECS | `string` | n/a | yes |
| <a name="input_efs_volumes"></a> [efs\_volumes](#input\_efs\_volumes) | Configuration for EFS volumes to be mounted in the container | <pre>list(object({<br>    volume_name      = string<br>    file_system_id   = string<br>    file_system_root = string<br>    mount_point      = string<br>    readonly         = bool<br>  }))</pre> | `[]` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | List of environment variables to be passed to the container | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs where the ECS tasks will be placed | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region where resources will be created | `string` | n/a | yes |
| <a name="input_scale_in_adjustment"></a> [scale\_in\_adjustment](#input\_scale\_in\_adjustment) | Number of tasks to remove during scale in | `number` | `-1` | no |
| <a name="input_scale_in_comparison_operator"></a> [scale\_in\_comparison\_operator](#input\_scale\_in\_comparison\_operator) | Comparison operator for scale in condition | `string` | `"LessThanOrEqualToThreshold"` | no |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | Cooldown period in seconds after scale in | `number` | `120` | no |
| <a name="input_scale_in_cpu_threshold"></a> [scale\_in\_cpu\_threshold](#input\_scale\_in\_cpu\_threshold) | CPU threshold percentage to trigger scale in | `number` | `30` | no |
| <a name="input_scale_in_evaluation_periods"></a> [scale\_in\_evaluation\_periods](#input\_scale\_in\_evaluation\_periods) | Number of periods to evaluate for scale in | `number` | `3` | no |
| <a name="input_scale_in_period"></a> [scale\_in\_period](#input\_scale\_in\_period) | Period in seconds over which the scale in statistic is applied | `number` | `120` | no |
| <a name="input_scale_in_statistic"></a> [scale\_in\_statistic](#input\_scale\_in\_statistic) | Statistic to use for scale in evaluation | `string` | `"Average"` | no |
| <a name="input_scale_out_adjustment"></a> [scale\_out\_adjustment](#input\_scale\_out\_adjustment) | Number of tasks to add during scale out | `number` | `1` | no |
| <a name="input_scale_out_comparison_operator"></a> [scale\_out\_comparison\_operator](#input\_scale\_out\_comparison\_operator) | Comparison operator for scale out condition | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | Cooldown period in seconds after scale out | `number` | `60` | no |
| <a name="input_scale_out_cpu_threshold"></a> [scale\_out\_cpu\_threshold](#input\_scale\_out\_cpu\_threshold) | CPU threshold percentage to trigger scale out | `number` | `80` | no |
| <a name="input_scale_out_evaluation_periods"></a> [scale\_out\_evaluation\_periods](#input\_scale\_out\_evaluation\_periods) | Number of periods to evaluate for scale out | `number` | `2` | no |
| <a name="input_scale_out_period"></a> [scale\_out\_period](#input\_scale\_out\_period) | Period in seconds over which the scale out statistic is applied | `number` | `60` | no |
| <a name="input_scale_out_statistic"></a> [scale\_out\_statistic](#input\_scale\_out\_statistic) | Statistic to use for scale out evaluation | `string` | `"Average"` | no |
| <a name="input_scale_tracking_cpu"></a> [scale\_tracking\_cpu](#input\_scale\_tracking\_cpu) | Target CPU utilization percentage for tracking-based autoscaling | `number` | `80` | no |
| <a name="input_scale_tracking_requests"></a> [scale\_tracking\_requests](#input\_scale\_tracking\_requests) | Target number of requests per target for tracking-based autoscaling | `number` | `0` | no |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | Type of autoscaling to use (e.g., 'target' or 'step') | `string` | `null` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | List of secrets to be retrieved from AWS Secrets Manager or SSM Parameter Store | <pre>list(object({<br>    name      = string<br>    valueFrom = string<br>  }))</pre> | `[]` | no |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | Amount of CPU units to allocate for the service | `number` | n/a | yes |
| <a name="input_service_healthcheck"></a> [service\_healthcheck](#input\_service\_healthcheck) | Configuration for the service health check | `map(any)` | n/a | yes |
| <a name="input_service_hosts"></a> [service\_hosts](#input\_service\_hosts) | List of host names for the service | `list(string)` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Configuration for the service launch type and capacity provider strategy | <pre>list(object({<br>    capacity_provider = string<br>    weight            = number<br>  }))</pre> | <pre>[<br>  {<br>    "capacity_provider": "FARGATE_SPOT",<br>    "weight": 100<br>  }<br>]</pre> | no |
| <a name="input_service_listener"></a> [service\_listener](#input\_service\_listener) | ARN of the ALB listener for the service | `string` | n/a | yes |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | Amount of memory (in MiB) to allocate for the service | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the ECS service | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Port number on which the container will receive traffic | `number` | n/a | yes |
| <a name="input_service_task_count"></a> [service\_task\_count](#input\_service\_task\_count) | Desired number of tasks to run in the service | `number` | n/a | yes |
| <a name="input_service_task_execution_role"></a> [service\_task\_execution\_role](#input\_service\_task\_execution\_role) | ARN of the IAM role that the ECS task will use for execution | `string` | n/a | yes |
| <a name="input_task_maximum"></a> [task\_maximum](#input\_task\_maximum) | Maximum number of tasks allowed | `number` | `10` | no |
| <a name="input_task_minimum"></a> [task\_minimum](#input\_task\_minimum) | Minimum number of tasks to maintain | `number` | `3` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where resources will be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->