variable "name" {
  description = "ECS Cluster Name"
}
variable "tags" {
  description = "Map of tags to apply to cluster"
  default     = {}
}
variable "enable_container_insights" {
  description = "Enable Cloudwatch Container Insights"
  default     = false
}

