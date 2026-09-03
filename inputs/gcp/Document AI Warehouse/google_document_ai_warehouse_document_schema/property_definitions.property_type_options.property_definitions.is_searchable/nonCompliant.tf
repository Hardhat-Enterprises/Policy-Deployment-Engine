resource "google_document_ai_warehouse_document_schema" "non_compliant_example_1" {
  project_number = "123456789012"
  display_name   = "test-document-schema"
  location       = "us"

  property_definitions {
    name = "parent_prop"

    property_type_options {
      property_definitions {
        name          = "child_prop"
        is_searchable = true
      }
    }
  }
}
