# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_api_gateway_api_config" "nc" {
  provider = google-beta
  api      = "projects/api_cfg/locations/Australia/apis/sample-api-noncompliant"
  project  = "terraform-456801"

   display_name = "Non-Compliant gRPC API"

  grpc_services {
    file_descriptor_set {
      path     = "api_descriptor.pb"
      contents = filebase64("api_descriptor.pb")
    }
  }

  managed_service_configs {
   path     = "invalid_config.json"
    contents = "ewogICJ0eXBlIjogImdvb2dsZS5hcGkuU2VydmljZSIsCiAgImNvbmZpZ1ZlcnNpb24iOiAzLAogICJuYW1lIjogImRlbW8tYXBpLmVuZHBvaW50cy5kZW1vLXByb2plY3QuY2xvdWQuZ29vZyIsCiAgInRpdGxlIjogIkRlbW8gQVBJIiwKICAiYXBpcyI6IFsKICAgIHsKICAgICAgIm5hbWUiOiAiRGVtb1NlcnZpY2UiCiAgICB9CiAgXSwKICAidXNhZ2UiOiB7CiAgICAicnVsZXMiOiBbCiAgICAgIHsKICAgICAgICAic2VsZWN0b3IiOiAiKiIsCiAgICAgICAgImFsbG93VW5yZWdpc3RlcmVkQ2FsbHMiOiBmYWxzZQogICAgICB9CiAgICBdCiAgfSwKICAiYmFja2VuZCI6IHsKICAgICJydWxlcyI6IFsKICAgICAgewogICAgICAgICJzZWxlY3RvciI6ICIqIiwKICAgICAgICAiYWRkcmVzcyI6ICJodHRwczovL2JhY2tlbmQuZGVtby1wcm9qZWN0LmNsb3VkLmdvb2ciCiAgICAgIH0KICAgIF0KICB9Cn0K"
  }
}