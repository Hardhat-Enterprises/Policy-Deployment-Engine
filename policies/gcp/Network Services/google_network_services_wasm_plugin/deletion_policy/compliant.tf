resource "google_network_services_wasm_plugin" "compliant_example_1" {
  name            = "compliant-wasm-plugin"
  location        = "australia-southeast1"
  main_version_id = "v1"

  deletion_policy = "PREVENT"

  versions {
    version_name = "v1"
  }
}