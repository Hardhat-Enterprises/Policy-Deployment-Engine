resource "google_gke_backup_backup_channel" "c" {
  name                = "c"
  location           = "australia-southeast1"
  destination_project = "projects/fluent-coder-468700-h4"
  project            = "fluent-coder-468700-h4"
  
  description = "Compliant backup channel in approved Australian region"
  
  labels = {
    environment = "production"
    compliance  = "data-residency-au"
    region      = "australia-southeast1"
  }
}