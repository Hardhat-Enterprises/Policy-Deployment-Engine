# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_endpoints_service" "nc" {
  project      = "my-project-nc"
  
  # 1) Bad name: doesn’t end in .endpoints.my-project.cloud.goog
  service_name = "api-myservice"

  # 2) Missing both openapi_config *and* (grpc_config + protoc_output_base64)
}