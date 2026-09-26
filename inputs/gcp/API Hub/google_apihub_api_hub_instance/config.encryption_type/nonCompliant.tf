resource "google_apihub_api_hub_instance" "non_compliant_example_1"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "non_compliant_example_1"
    config {
        encryption_type = "GMEK"
    }
}
