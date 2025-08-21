resource "google_apihub_api_hub_instance" "c"{
    project  = "PDE"
    location = "us-central1"
    config {
        encryption_type = "CMEK"
    }
}

