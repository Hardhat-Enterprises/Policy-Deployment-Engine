resource "google_compute_region_security_policy" "compliant_example_1" {
  name            = "compliant_example_1"
  project         = "pde-project-vindya"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
  type            = "CLOUD_ARMOR_NETWORK"

  advanced_options_config {
    json_parsing = "STANDARD"

    json_custom_config {
      content_types = ["application/json"]
    }
  }
}