variable "region" {}

variable "service_name" {}

variable "cluster_name" {}

variable "vpc_id" {}

variable "private_subnets" {}

variable "service_port" {}

variable "service_cpu" {}

variable "service_memory" {}

variable "service_listener" {}

variable "service_task_execution_role" {}


variable "environment_variables" {
  type = list(any)
}

variable "capabilities" {

}

variable "service_healthcheck" {}

variable "service_launch_type" {}

variable "service_task_count" {}

variable "service_hosts" {}