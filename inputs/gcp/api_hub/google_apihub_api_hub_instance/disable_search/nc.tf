resource "google_apihub_api_hub_instance" "nc"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "nc1"
    config {
        disable_search = false
    }
}