resource "google_apihub_api_hub_instance" "non_compliant_example_1"{
    api_hub_instance_id = "non_compliant_example_1"
    project  = "PDE"
    location = "null"
    config {
    }
}

resource "google_apihub_api_hub_instance" "non_compliant_example_2"{
    api_hub_instance_id = "non_compliant_example_2"
    project  = "PDE"
    location = "Austria"
    config {
    }
}
