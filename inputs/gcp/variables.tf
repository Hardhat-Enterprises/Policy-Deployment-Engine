variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "australia-southeast1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "australia-southeast1-a"
}

variable "machine_type" {
  description = "Instance machine type (must be E2 series: e2-micro, e2-small, e2-medium)"
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "OS image for the boot disk (must contain 'debian' or 'centos')"
  type        = string
  default     = "debian-cloud/debian-11"
}