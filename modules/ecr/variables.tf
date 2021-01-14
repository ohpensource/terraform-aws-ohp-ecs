variable "name" {
  description = "EC Repository Name"
}

variable "tags" {
  description = "Map of tags to apply to repository"
  default     = {}
}

variable "image_tag_mutability" {
  default     = "MUTABLE"
  description = "Image tag immutablity MUTABLE/IMMUTABLE"
}

variable "scan_image_on_push" {
  default     = false
  description = "Scan image for vulnerabilities on push"
}

variable "lifecycle_policy" {
  default     = ""
  description = "ECR lifecycle policy (json) - include <<EOF and EOF"
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
  default     = ["AWS"]
  description = "List of principals allowed to use the ECR policy"
}

variable "push_iam_user_name" {
  default     = ""
  description = "ECR Push User name  - leave blank if not required"
}

variable "pull_iam_user_name" {
  default     = ""
  description = "ECR Pull User name  - leave blank if not required"
}

variable "ecr_policy_type" {
  default     = ""
  description = "pull or push - leave blank if not required"
}

variable "ecr_pull_role_principal_type" { default = [""] }
variable "ecr_pull_role_principals" { default = [""] }
variable "ecr_push_role_principal_type" { default = [""] }
variable "ecr_push_role_principals" { default = [""] }
