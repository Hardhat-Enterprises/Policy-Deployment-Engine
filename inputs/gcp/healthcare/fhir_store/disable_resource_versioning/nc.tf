# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_fhir_store" "nc" {
    name = "testfhirstore-nc"
    dataset = "google_healthcare_dataset.nc.id"
    version = "STU3"

    disable_resource_versioning = true 
}