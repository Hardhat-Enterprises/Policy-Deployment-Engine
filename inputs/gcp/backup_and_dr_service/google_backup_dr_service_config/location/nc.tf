resource "google_backup_dr_service_config" "nc" { 
  project = "tamim-shahriar"
  location = "us-central1" 
  resource_type= "compute.googleapis.com/Instance"
}