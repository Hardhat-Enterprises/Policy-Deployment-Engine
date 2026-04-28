resource "google_contact_center_insights_assessment_rule" "nc" {
  project  = "PDE"
  location = "australia-southeast1"
  active   = false

  sample_rule {
    sample_percentage   = 10
    conversation_filter = "medium=\"PHONE_CALL\""
  }
}