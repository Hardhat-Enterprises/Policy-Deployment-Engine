resource "google_contact_center_insights_auto_labeling_rule" "c" {
  project        = "PDE"
  location       = "australia-southeast1"
  display_name   = "secure-auto-label-rule"
  label_key      = "risk_level"
  label_key_type = "LABEL_KEY_TYPE_CUSTOM"

}