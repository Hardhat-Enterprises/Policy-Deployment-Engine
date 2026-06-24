resource "google_apihub_api_hub_instance" "nc1"{
    api_hub_instance_id = "nc1"
    project  = "PDE"
    location = "null"
    config {
    }
}

resource "google_apihub_api_hub_instance" "nc2"{
    api_hub_instance_id = "nc2"
    project  = "PDE"
    location = "Austria"
    config {
    }
}