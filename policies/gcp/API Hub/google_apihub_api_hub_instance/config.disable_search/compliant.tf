resource "google_apihub_api_hub_instance" "compliant_example_1"{
    project  = "PDE"
    location = "us-central1"
    api_hub_instance_id = "compliant_example_1"
    config {
        disable_search = true
    }
}
