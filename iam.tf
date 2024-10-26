resource "aws_iam_role" "service_excution_role" {
  name = format("%s-%s-service-role", var.cluster_name, var.service_name)
  assume_role_policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy" "service_excution_role" {
  name = format("%s-%s-service-policy", var.cluster_name, var.service_name)
  role = aws_iam_role.service_excution_role.id

  policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
          "elasticloadbalancing:DeregisterTargets",
          "elasticloadbalancing:Describe*",
          "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
          "elasticloadbalancing:RegisterTargets",
          "ec2:Describe*",
          "ec2:AuthorizeSecurityGroupIngress",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}