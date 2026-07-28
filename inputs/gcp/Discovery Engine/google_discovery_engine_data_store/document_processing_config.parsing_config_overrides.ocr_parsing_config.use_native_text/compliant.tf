# data_store_document_processing_config

resource "google_discovery_engine_data_store" "compliant_example_1" {
project = "735927692082"

  location                    = "eu"
  data_store_id               = "compliant_example_1"
  display_name                = "tf-test-structured-datastore"
  industry_vertical           = "GENERIC"
  content_config              = "NO_CONTENT"
  solution_types              = ["SOLUTION_TYPE_SEARCH"]
  create_advanced_site_search = false

  document_processing_config {
    parsing_config_overrides {
      file_type = "pdf"
      ocr_parsing_config {
        use_native_text = true
      }
    }
  }
}

