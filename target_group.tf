resource "aws_alb_target_group" "main" {
  name = substr(sha256(format("%s-%s", var.service_name, var.cluster_name)), 0, 32)

  port   = var.service_port
  vpc_id = var.vpc_id

  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    healthy_threshold   = lookup(var.service_healthcheck, "healthy_thershold", "3")
    unhealthy_threshold = lookup(var.service_healthcheck, "unhealthy_thershold", "10")
    timeout             = lookup(var.service_healthcheck, "timeout", "10")
    interval            = lookup(var.service_healthcheck, "interval", "10")
    matcher             = lookup(var.service_healthcheck, "matcher", "200")
    path                = lookup(var.service_healthcheck, "path", "/")
    port                = lookup(var.service_healthcheck, "port", var.service_port)
  }

  lifecycle {
    create_before_destroy = false
  }
}