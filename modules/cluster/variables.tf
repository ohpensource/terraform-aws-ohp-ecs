variable "name" {
  type        = string
  description = "ECS Cluster Name"
}
variable "tags" {
  type        = map(any)
  description = "(Required) Map of tags to apply to cluster"
}
variable "enable_container_insights" {
  type        = bool
  description = "Enable Cloudwatch Container Insights"
  default     = false
}

