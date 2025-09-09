# main.tf - Place this in the root google_monitoring_alert_policy directory

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Variables
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "cluster_location" {
  description = "GKE Cluster Location"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU threshold percentage"
  type        = number
  default     = 80
}

variable "memory_threshold" {
  description = "Memory threshold percentage"
  type        = number
  default     = 80
}

# Common locals
locals {
  common_labels = {
    environment = "production"
    team        = "devops"
  }
}

# Notification channel
resource "google_monitoring_notification_channel" "email" {
  display_name = "Ops Team Email"
  type         = "email"
  labels = {
    email_address = "alerts@example.com"
  }
}

# Module calls for each alert policy
module "gke_cluster_cpu" {
  source = "./gke_cluster_cpu"
  
  cluster_name               = var.cluster_name
  cpu_threshold             = var.cpu_threshold
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "gke_node_memory" {
  source = "./gke_node_memory"
  
  cluster_name               = var.cluster_name
  memory_threshold          = var.memory_threshold
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "pod_restart_rate" {
  source = "./pod_restart_rate"
  
  cluster_name               = var.cluster_name
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "pv_disk_usage" {
  source = "./pv_disk_usage"
  
  cluster_name               = var.cluster_name
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "container_cpu_throttling" {
  source = "./container_cpu_throttling"
  
  cluster_name               = var.cluster_name
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "lb_error_rate" {
  source = "./lb_error_rate"
  
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "cloudsql_cpu" {
  source = "./cloudsql_cpu"
  
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "network_egress" {
  source = "./network_egress"
  
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "instance_uptime" {
  source = "./instance_uptime"
  
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}

module "api_latency" {
  source = "./api_latency"
  
  notification_channel_id   = google_monitoring_notification_channel.email.id
  common_labels            = local.common_labels
}