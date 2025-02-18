variable "region" {
  type        = string
  description = "AWS region where resources will be created"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "container_image" {
  type        = string
  description = "Image with tag for deploying the application to ECS"
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster where the service will be deployed"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where resources will be created"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs where the ECS tasks will be placed"
}

variable "service_port" {
  type        = number
  description = "Port number on which the container will receive traffic"
}

variable "service_cpu" {
  type        = number
  description = "Amount of CPU units to allocate for the service"
}

variable "service_memory" {
  type        = number
  description = "Amount of memory (in MiB) to allocate for the service"
}

variable "service_listener" {
  type        = string
  description = "ARN of the ALB listener for the service"
  default     = null
}

variable "service_task_execution_role" {
  type        = string
  description = "ARN of the IAM role that the ECS task will use for execution"
}

variable "environment_variables" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "List of environment variables to be passed to the container"
  default     = []
}

variable "capabilities" {
  type        = list(string)
  description = "List of additional capabilities required for the task"
  default     = []
}

variable "service_healthcheck" {
  type        = map(any)
  description = "Configuration for the service health check"
}

variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  description = "Configuration for the service launch type and capacity provider strategy"
  default = [{
    capacity_provider = "FARGATE_SPOT"
    weight            = 100
  }]
}

variable "service_task_count" {
  type        = number
  description = "Desired number of tasks to run in the service"
}

variable "service_hosts" {
  type        = list(string)
  description = "List of host names for the service"
}

# Autoscaling variables
variable "scale_type" {
  type        = string
  description = "Type of autoscaling to use (e.g., 'target' or 'step')"
  default     = null
}

variable "task_minimum" {
  type        = number
  description = "Minimum number of tasks to maintain"
  default     = 3
}

variable "task_maximum" {
  type        = number
  description = "Maximum number of tasks allowed"
  default     = 10
}

# Autoscaling CPU variables
variable "scale_out_cpu_threshold" {
  type        = number
  description = "CPU threshold percentage to trigger scale out"
  default     = 80
}

variable "scale_out_adjustment" {
  type        = number
  description = "Number of tasks to add during scale out"
  default     = 1
}

variable "scale_out_comparison_operator" {
  type        = string
  description = "Comparison operator for scale out condition"
  default     = "GreaterThanOrEqualToThreshold"
}

variable "scale_out_statistic" {
  type        = string
  description = "Statistic to use for scale out evaluation"
  default     = "Average"
}

variable "scale_out_period" {
  type        = number
  description = "Period in seconds over which the scale out statistic is applied"
  default     = 60
}

variable "scale_out_evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for scale out"
  default     = 2
}

variable "scale_out_cooldown" {
  type        = number
  description = "Cooldown period in seconds after scale out"
  default     = 60
}

variable "scale_in_cpu_threshold" {
  type        = number
  description = "CPU threshold percentage to trigger scale in"
  default     = 30
}

variable "scale_in_adjustment" {
  type        = number
  description = "Number of tasks to remove during scale in"
  default     = -1
}

variable "scale_in_comparison_operator" {
  type        = string
  description = "Comparison operator for scale in condition"
  default     = "LessThanOrEqualToThreshold"
}

variable "scale_in_statistic" {
  type        = string
  description = "Statistic to use for scale in evaluation"
  default     = "Average"
}

variable "scale_in_period" {
  type        = number
  description = "Period in seconds over which the scale in statistic is applied"
  default     = 120
}

variable "scale_in_evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for scale in"
  default     = 3
}

variable "scale_in_cooldown" {
  type        = number
  description = "Cooldown period in seconds after scale in"
  default     = 120
}

# Autoscaling tracking CPU
variable "scale_tracking_cpu" {
  type        = number
  description = "Target CPU utilization percentage for tracking-based autoscaling"
  default     = 80
}

# Autoscaling tracking requests
variable "alb_arn" {
  type        = string
  description = "ARN of the Application Load Balancer for request-based scaling"
  default     = null
}

variable "scale_tracking_requests" {
  type        = number
  description = "Target number of requests per target for tracking-based autoscaling"
  default     = 0
}

variable "efs_volumes" {
  type = list(object({
    volume_name      = string
    file_system_id   = string
    file_system_root = string
    mount_point      = string
    readonly         = bool
  }))
  description = "Configuration for EFS volumes to be mounted in the container"
  default     = []
}

variable "secrets" {
  type = list(object({
    name      = string
    valueFrom = string
  }))
  description = "List of secrets to be retrieved from AWS Secrets Manager or SSM Parameter Store"
  default     = []
}

variable "service_discovery_namespace" {
  type        = string
  description = "Name of the service discovery namespace for the service"
  default     = null

}