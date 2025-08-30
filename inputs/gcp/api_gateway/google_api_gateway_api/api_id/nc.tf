# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
#TRAINING 

resource "google_api_gateway_api" "nc" "api" {
  provider = "null"
  api_id = ""
}