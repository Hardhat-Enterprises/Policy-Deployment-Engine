resource "google_contact_center_insights_analysis_rule" "nc" {
  project  = "PDE"
  location = "australia-southeast1"

  conversation_filter = "medium=\"PHONE_CALL\""

  annotator_selector {
    run_summarization_annotator = false
  }
}