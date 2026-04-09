resource "google_apigee_api" "nc" {
  name          = "nc"
  org_id        = "Test_Org"
  config_bundle = "Test_Config_Bundle"
}