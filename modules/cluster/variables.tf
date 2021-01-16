variable "name" {
  type        = string
  description = "ECS Cluster Name"
}
variable "tags" {
  type        = map(any)
  description = "Map of tags to apply to cluster"
  default     = {}
}
variable "enable_container_insights" {
  type        = bool
  description = "Enable Cloudwatch Container Insights"
  default     = false
}

