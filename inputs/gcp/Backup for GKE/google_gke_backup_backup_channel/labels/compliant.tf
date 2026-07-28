resource "google_gke_backup_backup_channel" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  
  labels = {
    environment = "prod"
    team        = "platform"
    compliance  = "required"
    cost-center = "engineering"
    owner       = "platform-team"
    bandwidth-limit = "50mbps"
  }
}

