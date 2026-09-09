resource "google_network_services_wasm_plugin" "non_compliant_example_1" {
  name            = "noncompliant-wasm-plugin"
  location        = "australia-southeast1"
  main_version_id = "v1"

  deletion_policy = "DELETE"

  versions {
    version_name = "v1"
  }
}