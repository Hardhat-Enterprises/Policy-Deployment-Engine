resource "google_gke_backup_restore_channel" "compliant_example_1" {
  name                = "compliant_example_1"
  location            = "australia-southeast1"
  project             = "PDE"
  destination_project = "projects/PDE"
  
  labels = {
    data-classification = "sensitive"
    compliance          = "required"
    environment         = "prod"
    disaster-recovery   = "critical"
    encryption          = "cmek-required"
    owner               = "platform-team"
    cost-center         = "engineering"
  }
}

