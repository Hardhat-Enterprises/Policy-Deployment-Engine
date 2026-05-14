resource "google_endpoints_service" "c" {
  project = "my-project-123"
  service_name = "api.endpoints.my-project-123.cloud.goog"

  openapi_config = <<EOF
swagger: "2.0"
info:
  title: "api"
  version: "1.0.0"
host: "api.endpoints.my-project-123.cloud.goog"
schemes:
  - https
paths:
  /hello:
    get:
      responses:
        200:
          description: OK
EOF
}