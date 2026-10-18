resource "google_dialogflow_cx_tool_version" "compliant_example_1" {
  parent       = "projects/test-project/locations/global/agents/test-agent/tools/test-tool"
  display_name = "compliant-example-1"

  tool {
    display_name = "example-tool"
    description  = "Example tool"

    data_store_spec {
      data_store_connections {
        data_store_type          = "UNSTRUCTURED"
        data_store               = "projects/test-project/locations/global/collections/default_collection/dataStores/example-store"
        document_processing_mode = "DOCUMENTS"
      }

      fallback_prompt {}
    }
  }
}