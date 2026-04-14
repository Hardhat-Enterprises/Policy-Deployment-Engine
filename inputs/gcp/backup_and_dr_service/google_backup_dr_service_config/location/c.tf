resource "google_backup_dr_service_config" "c" {
  project       = "my-project-4418-1743628379470"
  location      = "australia-southeast1"
  resource_type = "compute.googleapis.com/Instance"
}

