variable "project_id" {
  description = "The ID of the project where resources will be created."
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed."
  type        = string
  default     = "us-central1"
}
