resource "google_apihub_api_hub_instance" "nc1"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "nc1"
    config {
        cmek_key_name = "projects/other-project/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key"
    }
}

resource "google_apihub_api_hub_instance" "nc2"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "nc2"
    config {
        cmek_key_name = "NULL"
    }
}

resource "google_apihub_api_hub_instance" "nc3"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "nc3"
    config {
        cmek_key_name = "my_key_random_key"
    }
}