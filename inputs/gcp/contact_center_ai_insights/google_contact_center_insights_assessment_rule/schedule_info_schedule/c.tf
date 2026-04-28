resource "google_contact_center_insights_assessment_rule" "c" {
  project  = "PDE"
  location = "australia-southeast1"
  active   = true

  sample_rule {
    sample_percentage   = 10
    conversation_filter = "medium=\"PHONE_CALL\""
  }

  schedule_info {
    schedule = "0 0 * * *"
  }
}