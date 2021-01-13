# module "alb_ingress" {
#   source = "git::https://github.com/cloudposse/terraform-aws-alb-ingress.git?ref=tags/0.15.0"

#   vpc_id                       = var.vpc_id
#   port                         = var.container_port
#   health_check_path            = var.alb_ingress_healthcheck_path
#   health_check_protocol        = var.alb_ingress_healthcheck_protocol
#   default_target_group_enabled = var.alb_ingress_enable_default_target_group
#   target_group_arn             = var.alb_ingress_target_group_arn

#   authenticated_paths   = var.alb_ingress_authenticated_paths
#   unauthenticated_paths = var.alb_ingress_unauthenticated_paths
#   authenticated_hosts   = var.alb_ingress_authenticated_hosts
#   unauthenticated_hosts = var.alb_ingress_unauthenticated_hosts

#   authenticated_priority   = var.alb_ingress_listener_authenticated_priority
#   unauthenticated_priority = var.alb_ingress_listener_unauthenticated_priority

#   unauthenticated_listener_arns       = var.alb_ingress_unauthenticated_listener_arns
#   unauthenticated_listener_arns_count = var.alb_ingress_unauthenticated_listener_arns_count
#   authenticated_listener_arns         = var.alb_ingress_authenticated_listener_arns
#   authenticated_listener_arns_count   = var.alb_ingress_authenticated_listener_arns_count

#   authentication_type                        = var.authentication_type
#   authentication_cognito_user_pool_arn       = var.authentication_cognito_user_pool_arn
#   authentication_cognito_user_pool_client_id = var.authentication_cognito_user_pool_client_id
#   authentication_cognito_user_pool_domain    = var.authentication_cognito_user_pool_domain
#   authentication_cognito_scope               = var.authentication_cognito_scope
#   authentication_oidc_client_id              = var.authentication_oidc_client_id
#   authentication_oidc_client_secret          = var.authentication_oidc_client_secret
#   authentication_oidc_issuer                 = var.authentication_oidc_issuer
#   authentication_oidc_authorization_endpoint = var.authentication_oidc_authorization_endpoint
#   authentication_oidc_token_endpoint         = var.authentication_oidc_token_endpoint
#   authentication_oidc_user_info_endpoint     = var.authentication_oidc_user_info_endpoint
#   authentication_oidc_scope                  = var.authentication_oidc_scope

#   context = module.this.context
# }
