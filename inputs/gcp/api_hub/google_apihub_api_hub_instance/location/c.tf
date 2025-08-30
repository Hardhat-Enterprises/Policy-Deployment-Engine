# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
#For location

resource "google_apihub_api_hub_instance" "c"{
    api_hub_instance_id = "c"
    project  = "PDE"
    location = "us-central1"
    config {
    }
}