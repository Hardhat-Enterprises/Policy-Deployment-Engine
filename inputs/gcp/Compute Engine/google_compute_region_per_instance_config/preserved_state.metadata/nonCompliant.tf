resource "google_compute_region_per_instance_config" "non_compliant_example_1" {
  region = "australia-southeast1"
  region_instance_group_manager = "google_compute_region_instance_group_manager.rigm.name"
  name = "non_compliant_example_1"
  project = "pde"

  preserved_state {
    metadata = {
      password = "password123"
      api_key = "realapikey123"
    } 
}
}