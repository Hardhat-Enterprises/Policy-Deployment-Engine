# Compliant Looker Core instance with maintenance window set
# This resource is compliant because maintenance_window block is configured

resource "google_looker_instance" "c" {
  name              = "looker-core-compliant-maintenance-window"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  
  maintenance_window {
    day_of_week = "SUNDAY"
    start_time {
      hours   = 2
      minutes = 0
      nanos   = 0
      seconds = 0
    }
  }
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}