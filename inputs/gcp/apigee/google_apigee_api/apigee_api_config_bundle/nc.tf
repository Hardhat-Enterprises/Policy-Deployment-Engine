resource "google_apigee_api" "nc" {
  name          = "proxy1"
  org_id        = "Test_Org"
  config_bundle = "Test_Config_Bundle"
}