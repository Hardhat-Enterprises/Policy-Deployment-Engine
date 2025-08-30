# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
#TRAINING EXAMPLE 
resource "google_api_gateway_api" "c" "api" {
  provider = google-beta
  api_id = "my-api"
}
