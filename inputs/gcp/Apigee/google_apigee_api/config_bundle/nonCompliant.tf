resource "google_apigee_api" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  org_id        = "PDE-API-Proxy"
  config_bundle = "Test_Config_Bundle"
}
