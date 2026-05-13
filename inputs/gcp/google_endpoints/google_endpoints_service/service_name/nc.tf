resource "google_endpoints_service" "nc" {
  project = "my-project-123"
  service_name = "nc"

  openapi_config = <<EOF
swagger: "2.0"
info:
  title: "api"
  version: "1.0.0"
host: "api.example.com"
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