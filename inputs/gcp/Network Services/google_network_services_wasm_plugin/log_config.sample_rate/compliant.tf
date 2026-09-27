resource "google_network_services_wasm_plugin" "compliant_example_1" {
  name            = "compliant-wasm-plugin"
  location        = "australia-southeast1"
  main_version_id = "v1"

  log_config {
    enable      = true
    sample_rate = 1.0
  }

  versions {
    version_name = "v1"
  }
}