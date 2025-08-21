resource "google_apihub_api_hub_instance" "nc"{
    project  = "test_name"
    location = "us-central1"
    config {
        encryption_type = "GMEK"
    }
}