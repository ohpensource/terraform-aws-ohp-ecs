variable "name" {
  description = "EC Repository Name"
}

variable "tags" {
  description = "Map of tags to apply to repository"
  default     = {}
}

variable "image_tag_mutability" {
  default     = "IMMUTABLE"
  description = "Image tag immutablity MUTABLE/IMMUTABLE"
}

variable "scan_image_on_push" {
  default     = true
  description = "Scan image for vulnerabilities on push"
}

variable "lifecycle_policy" {
  default     = null
  description = "ECR lifecycle policy (jsonencoded)"
}

variable "expire_untagged_image_days" {
  default     = 30
  description = "Expire untagged images older than X days"
}

variable "keep_last_x_tagged_images" {
  default     = 10
  description = "Keep last X tagged images"
}

variable "tag_prefix_list" {
  default     = ["v"]
  description = "List of tag prefixes"
}

variable "ecr_policy_principals" {
  default     = ["*"]
  description = "List of principals allowed to use the ECR policy"
}

variable "ecr_policy_principal_type" {
  default     = "AWS"
  description = "List of principals allowed to use the ECR policy"
}

variable "push_iam_user_name" {
  default     = null
  description = "ECR Push User name - leave blank for default name based on var.name"
}

variable "pull_iam_user_name" {
  default     = null
  description = "ECR Pull User name - leave blank for default name based on var.name"
}

variable "push_iam_role_name" {
  default     = null
  description = "ECR Push Role name - leave blank for default name based on var.name"
}

variable "pull_iam_role_name" {
  default     = null
  description = "ECR Pull Role name - leave blank for default name based on var.name"
}

variable "default_ecr_policy_type" {
  default     = null
  description = "pull or push"
}

variable "custom_ecr_policy" {
  default     = null
  description = "Json formatted ECR policy - overrides any default policy"
}

variable "ecr_pull_role_principal_type" {
  default = "*"
}

variable "ecr_pull_role_principals" {
  type    = list(any)
  default = ["*"]
}

variable "ecr_push_role_principal_type" {
  default = "*"
}

variable "ecr_push_role_principals" {
  type    = list(any)
  default = ["*"]
}

variable "ecr_pull_role_policy_arn" {
  type        = string
  default     = null
  description = "Arn of ECR policy to attach to pull role"
}

variable "ecr_push_role_policy_arn" {
  type        = string
  default     = null
  description = "Arn of ECR policy to attach to push role"
}

variable "create_iam_user_push" {
  type    = bool
  default = false
}

variable "create_iam_user_pull" {
  type    = bool
  default = false
}

variable "create_iam_role_push" {
  type    = bool
  default = false
}

variable "create_iam_role_pull" {
  type    = bool
  default = false
}

variable "create_ecr_policy" {
  type    = bool
  default = false
}
