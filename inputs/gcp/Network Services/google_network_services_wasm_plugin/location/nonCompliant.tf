resource "google_network_services_wasm_plugin" "non_compliant_example_1" {
  name            = "noncompliant-wasm-plugin"
  location        = "global"
  main_version_id = "v1"

  versions {
    version_name = "v1"
  }
}