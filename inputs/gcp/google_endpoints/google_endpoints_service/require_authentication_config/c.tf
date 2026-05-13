resource "google_endpoints_service" "c" {
  project      = "my-project-123"
  service_name = "api.endpoints.my-project-123.cloud.goog"

  openapi_config = <<EOF
swagger: "2.0"
info:
  title: "authenticated-api"
  version: "1.0.0"
host: "api.endpoints.my-project-123.cloud.goog"
schemes:
  - https
securityDefinitions:
  api_key:
    type: "apiKey"
    name: "key"
    in: "query"
security:
  - api_key: []
paths:
  /hello:
    get:
      operationId: hello
      responses:
        200:
          description: OK
EOF
}