resource "google_endpoints_service" "c" {
  project      = "my-project-12345"
  service_name = "c"

  openapi_config = <<EOF
swagger: "2.0"
info:
  title: "secure-api"
  version: "1.0.0"
host: "api.endpoints.my-project-12345.cloud.goog"
schemes:
  - https
paths:
  /hello:
    get:
      operationId: hello
      responses:
        200:
          description: OK
EOF
}