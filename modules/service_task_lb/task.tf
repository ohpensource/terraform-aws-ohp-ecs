# resource "aws_ecs_task_definition" "main" {
#   count                    = local.enabled ? 1 : 0
#   family                   = module.this.id
#   container_definitions    = var.container_definition_json
#   requires_compatibilities = [var.launch_type]
#   network_mode             = var.network_mode
#   cpu                      = var.task_cpu
#   memory                   = var.task_memory
#   execution_role_arn       = length(var.task_exec_role_arn) > 0 ? var.task_exec_role_arn : join("", aws_iam_role.ecs_exec.*.arn)
#   task_role_arn            = length(var.task_role_arn) > 0 ? var.task_role_arn : join("", aws_iam_role.ecs_task.*.arn)

#   dynamic "proxy_configuration" {
#     for_each = var.proxy_configuration == null ? [] : [var.proxy_configuration]
#     content {
#       type           = lookup(proxy_configuration.value, "type", "APPMESH")
#       container_name = proxy_configuration.value.container_name
#       properties     = proxy_configuration.value.properties
#     }
#   }

#   dynamic "placement_constraints" {
#     for_each = var.task_placement_constraints
#     content {
#       type       = placement_constraints.value.type
#       expression = lookup(placement_constraints.value, "expression", null)
#     }
#   }

#   dynamic "volume" {
#     for_each = var.volumes
#     content {
#       host_path = lookup(volume.value, "host_path", null)
#       name      = volume.value.name

#       dynamic "docker_volume_configuration" {
#         for_each = lookup(volume.value, "docker_volume_configuration", [])
#         content {
#           autoprovision = lookup(docker_volume_configuration.value, "autoprovision", null)
#           driver        = lookup(docker_volume_configuration.value, "driver", null)
#           driver_opts   = lookup(docker_volume_configuration.value, "driver_opts", null)
#           labels        = lookup(docker_volume_configuration.value, "labels", null)
#           scope         = lookup(docker_volume_configuration.value, "scope", null)
#         }
#       }

#       dynamic "efs_volume_configuration" {
#         for_each = lookup(volume.value, "efs_volume_configuration", [])
#         content {
#           file_system_id          = lookup(efs_volume_configuration.value, "file_system_id", null)
#           root_directory          = lookup(efs_volume_configuration.value, "root_directory", null)
#           transit_encryption      = lookup(efs_volume_configuration.value, "transit_encryption", null)
#           transit_encryption_port = lookup(efs_volume_configuration.value, "transit_encryption_port", null)
#           dynamic "authorization_config" {
#             for_each = lookup(efs_volume_configuration.value, "authorization_config", [])
#             content {
#               access_point_id = lookup(authorization_config.value, "access_point_id", null)
#               iam             = lookup(authorization_config.value, "iam", null)
#             }
#           }
#         }
#       }
#     }
#   }

#   tags = var.use_old_arn ? null : module.this.tags
# }
