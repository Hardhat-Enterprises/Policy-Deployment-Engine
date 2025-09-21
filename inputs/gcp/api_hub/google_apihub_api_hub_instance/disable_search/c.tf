resource "google_apihub_api_hub_instance" "c1"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "c1"
    config {
        disable_search = true
    }
}