resource "google_backup_dr_service_config" "c" { 
  project = "tamim-shahriar"
  location = "australia-southeast1" 
  resource_type= "compute.googleapis.com/Instance"
}

