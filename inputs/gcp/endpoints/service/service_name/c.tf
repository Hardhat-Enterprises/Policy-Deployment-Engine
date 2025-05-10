# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_endpoints_service" "c" {
  # replace with actual GCP project
  project       = "my1-project-c"

  # must end with “.endpoints.<project>.cloud.goog”
  service_name  = "my1-api.endpoints.my1-project-c.cloud.goog"

  # supplying an OpenAPI spec (can be empty JSON for tests)
  #openapi_config = "{}"
}
