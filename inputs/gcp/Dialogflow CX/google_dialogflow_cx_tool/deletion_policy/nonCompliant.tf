resource "google_dialogflow_cx_tool" "non_compliant_example_1" {
  parent          = "projects/example-project/locations/global/agents/example-agent"
  display_name    = "non_compliant_example_1"
  description     = "Dialogflow CX Tool fixture."
  deletion_policy = "DELETE"

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
  }
}
