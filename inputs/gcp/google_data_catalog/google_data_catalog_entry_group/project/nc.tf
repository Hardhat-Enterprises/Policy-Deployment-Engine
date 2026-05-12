resource "google_data_catalog_entry_group" "nc" {
  entry_group_id = "approved_entry_group"

  display_name = "terraform entry group"
  description  = "entry group created by Terraform"

  region  = "australia-southeast1"
  project = "my_project"
}