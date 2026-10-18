resource "google_document_ai_warehouse_document_schema" "compliant_example_1" {
  project_number = "123456789012"
  display_name   = "test-document-schema"
  location       = "us"

  property_definitions {
    name = "prop1"
  }
}
