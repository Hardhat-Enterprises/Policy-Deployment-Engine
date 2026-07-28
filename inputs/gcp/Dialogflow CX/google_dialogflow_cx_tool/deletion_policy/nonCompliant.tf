resource "google_dialogflow_cx_tool" "non_compliant_example_1" {
  parent          = "projects/noncompliant-project/locations/global/agents/noncompliant-agent"
  display_name    = "non-compliant-tool"
  description     = "Tool with deletion protection disabled."
  deletion_policy = "DELETE"

  open_api_spec {
    text_schema = <<-EOT
      {"openapi":"3.0.0","info":{"title":"Example","version":"1.0.0"},"paths":{}}
    EOT
  }
}
