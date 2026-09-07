resource "google_network_services_wasm_plugin" "non_compliant_example_1" {
  name            = "noncompliant-wasm-plugin"
  location        = "australia-southeast1"
  main_version_id = "v1"

  log_config {
    enable        = true
    min_log_level = "LOG_LEVEL_UNSPECIFIED"
  }

  versions {
    version_name = "v1"
  }
}