resource "google_data_catalog_tag" "nc" {
  parent   = "approved_data_catalog_entry"
  template = "unapproved_tag_template"

  fields {
    field_name   = "source"
    string_value = "my-string"
  }
}
