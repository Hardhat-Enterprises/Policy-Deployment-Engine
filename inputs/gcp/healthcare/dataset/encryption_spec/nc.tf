# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
    name = "testdataset-nc"
    location = "australia-southeast1"

    project = "project" 
    
    encryption_spec {
    kms_key_name = "wrong_key"
  }
}