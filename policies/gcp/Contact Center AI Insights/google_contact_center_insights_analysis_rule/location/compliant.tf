resource "google_contact_center_insights_analysis_rule" "compliant_example_1" {
  project  = "PDE"
  location = "australia-southeast1"

  conversation_filter = "medium=\"PHONE_CALL\""

}
