resource "google_contact_center_insights_analysis_rule" "nc" {
  project  = "PDE"
  location = "australia-southeast1"

  conversation_filter = "medium=\"PHONE_CALL\""

  annotator_selector {
    qa_config {
      scorecard_list {
        qa_scorecard_revisions = []
      }
    }
  }
}