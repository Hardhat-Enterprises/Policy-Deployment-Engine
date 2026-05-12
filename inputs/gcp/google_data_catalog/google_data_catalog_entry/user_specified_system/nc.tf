resource "google_data_catalog_entry" "nc" {
  entry_group = "approved_entry_group"
  entry_id    = "my_entry"

  user_specified_type   = "approved_custom_type"
  user_specified_system = "unapproved_system"
}
