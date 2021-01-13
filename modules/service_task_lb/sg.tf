# ## Security Groups
# resource "aws_security_group" "ecs_service" {
#   count       = local.enabled ? 1 : 0
#   vpc_id      = var.vpc_id
#   name        = module.service_label.id
#   description = "Allow ALL egress from ECS service"
#   tags        = module.service_label.tags
# }

# resource "aws_security_group_rule" "allow_all_egress" {
#   count             = local.enabled && var.enable_all_egress_rule ? 1 : 0
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = join("", aws_security_group.ecs_service.*.id)
# }

# resource "aws_security_group_rule" "allow_icmp_ingress" {
#   count             = local.enabled && var.enable_icmp_rule ? 1 : 0
#   description       = "Enables ping command from anywhere, see https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-rules-reference.html#sg-rules-ping"
#   type              = "ingress"
#   from_port         = 8
#   to_port           = 0
#   protocol          = "icmp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = join("", aws_security_group.ecs_service.*.id)
# }

# resource "aws_security_group_rule" "alb" {
#   count                    = local.enabled && var.use_alb_security_group ? 1 : 0
#   type                     = "ingress"
#   from_port                = var.container_port
#   to_port                  = var.container_port
#   protocol                 = "tcp"
#   source_security_group_id = var.alb_security_group
#   security_group_id        = join("", aws_security_group.ecs_service.*.id)
# }

# resource "aws_security_group_rule" "nlb" {
#   count             = local.enabled && var.use_nlb_cidr_blocks ? 1 : 0
#   type              = "ingress"
#   from_port         = var.nlb_container_port
#   to_port           = var.nlb_container_port
#   protocol          = "tcp"
#   cidr_blocks       = var.nlb_cidr_blocks
#   security_group_id = join("", aws_security_group.ecs_service.*.id)
# }
