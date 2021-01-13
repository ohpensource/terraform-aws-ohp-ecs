resource "aws_appautoscaling_target" "main" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${var.ecs_cluster_name}/${aws_ecs_service.main.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "main" {
  name               = "scale-in-out"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.main.resource_id
  scalable_dimension = aws_appautoscaling_target.main.scalable_dimension
  service_namespace  = aws_appautoscaling_target.main.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value       = var.target_value
    disable_scale_in   = var.disable_scale_in
    scale_in_cooldown  = var.scale_in_cooldown
    scale_out_cooldown = var.scale_out_cooldown
    predefined_metric_specification {
      predefined_metric_type = var.autoscale_predefined_metric
    }
    # customized_metric_specification {
    #   metric_name = "MyUtilizationMetric"
    #   namespace   = "MyNamespace"
    #   statistic   = "Average"
    #   unit        = "Percent"

    #   dimensions {
    #     name  = "MyOptionalMetricDimensionName"
    #     value = "MyOptionalMetricDimensionValue"
    #   }
    # }
  }
  lifecycle {
    create_before_destroy = false
  }
}
