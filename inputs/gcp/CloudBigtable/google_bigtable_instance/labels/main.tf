provider "google" {
  project = var.project_id
  region  = var.region
}

# Include the configurations for each folder
module "folder_c" {
  source = "./folder_configurations/C"
}

module "folder_nc" {
  source = "./folder_configurations/NC"
}
