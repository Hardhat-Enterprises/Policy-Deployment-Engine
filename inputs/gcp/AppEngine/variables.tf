variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP region for App Engine"
}

variable "credentials_file" {
  type        = string
  description = "Path to your GCP credentials JSON file"
}