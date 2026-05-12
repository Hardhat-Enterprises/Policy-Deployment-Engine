resource "google_data_catalog_tag" "c" {
  parent   = "approved_data_catalog_entry"
  template = "approved_tag_template"

  fields {
    field_name   = "source"
    string_value = "my-string"
  }
}
