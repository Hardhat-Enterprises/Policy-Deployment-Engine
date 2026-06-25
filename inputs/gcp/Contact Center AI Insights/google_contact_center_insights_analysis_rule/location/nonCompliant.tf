resource "google_contact_center_insights_analysis_rule" "non_compliant_example_1" {
  project  = "PDE"
  location = "us-central1"

  conversation_filter = "medium=\"PHONE_CALL\""

}
