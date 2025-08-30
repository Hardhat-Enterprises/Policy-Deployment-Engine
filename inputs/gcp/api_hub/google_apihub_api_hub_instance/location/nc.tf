# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

#For location

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