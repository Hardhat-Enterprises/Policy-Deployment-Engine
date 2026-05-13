resource "google_endpoints_service" "c" {
  project      = "my-project-123"
  service_name = "grpc-api.endpoints.my-project-123.cloud.goog"

  grpc_config = <<EOF
type: google.api.Service
config_version: 3
name: grpc-api.endpoints.my-project-123.cloud.goog
apis:
  - name: example.v1.ExampleService
EOF

  protoc_output_base64 = base64encode("dummy-descriptor")
}