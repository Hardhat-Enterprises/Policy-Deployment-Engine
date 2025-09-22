resource "google_apihub_api_hub_instance" "c"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "c"
    config {
        encryption_type = "CMEK"
    }
}

