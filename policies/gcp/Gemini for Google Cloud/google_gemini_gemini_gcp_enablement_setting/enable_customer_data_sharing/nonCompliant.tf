resource "google_gemini_gemini_gcp_enablement_setting" "non_compliant_example_1"{
  gemini_gcp_enablement_setting_id = "non_compliant_example_1"
  project = "PDE"
  location = "australia-southeast2"
  enable_customer_data_sharing = true
}
