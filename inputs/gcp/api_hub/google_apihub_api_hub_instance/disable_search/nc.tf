resource "google_apihub_api_hub_instance" "nc"{
    project  = "PDE"
    location = "us-central1"
    config {
        disable_search = false
    }
}