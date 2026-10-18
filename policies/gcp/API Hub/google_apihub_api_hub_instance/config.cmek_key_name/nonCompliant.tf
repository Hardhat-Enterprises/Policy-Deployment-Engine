resource "google_apihub_api_hub_instance" "non_compliant_example_1"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "non_compliant_example_1"
    config {
        cmek_key_name = "projects/other-project/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key"
    }
}

resource "google_apihub_api_hub_instance" "non_compliant_example_2"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "non_compliant_example_2"
    config {
        cmek_key_name = "NULL"
    }
}

resource "google_apihub_api_hub_instance" "non_compliant_example_3"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "non_compliant_example_3"
    config {
        cmek_key_name = "my_key_random_key"
    }
}
