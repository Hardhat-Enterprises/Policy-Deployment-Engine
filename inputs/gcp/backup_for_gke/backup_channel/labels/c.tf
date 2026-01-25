resource "google_gke_backup_backup_channel" "c" {
  name                = "c"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  
  labels = {
    environment = "prod"
    team        = "platform"
    compliance  = "required"
    cost-center = "engineering"
    owner       = "platform-team"
  }
}

