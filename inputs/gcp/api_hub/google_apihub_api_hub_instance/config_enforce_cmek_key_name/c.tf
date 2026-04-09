resource "google_apihub_api_hub_instance" "c"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "c"
    config {
        cmek_key_name = "projects/PDE/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key"
    }
}

