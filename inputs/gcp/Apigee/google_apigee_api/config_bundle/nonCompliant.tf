resource "google_apigee_api" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  org_id        = "Test_Org"
  config_bundle = "Test_Config_Bundle"
}
