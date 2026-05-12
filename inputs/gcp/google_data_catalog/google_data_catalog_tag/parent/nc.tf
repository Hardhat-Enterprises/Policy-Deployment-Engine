resource "google_data_catalog_tag" "nc" {
  parent   = "unapproved_data_catalog_entry"
  template = "approved_tag_template"

  fields {
    field_name   = "source"
    string_value = "my-string"
  }
}
