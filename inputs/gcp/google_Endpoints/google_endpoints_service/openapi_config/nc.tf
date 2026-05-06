resource "google_endpoints_service" "nc" {
  project      = "my-project-12345"
  service_name = "api.endpoints.my-project-12345.cloud.goog"

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