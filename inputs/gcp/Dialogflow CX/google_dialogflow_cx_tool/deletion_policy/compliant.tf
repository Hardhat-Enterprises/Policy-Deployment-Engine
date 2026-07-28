resource "google_dialogflow_cx_tool" "compliant_example_1" {
  parent          = "projects/compliant-project/locations/global/agents/compliant-agent"
  display_name    = "compliant-tool"
  description     = "Tool protected from accidental deletion."
  deletion_policy = "PREVENT"

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
  }
}
