# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_fhir_store" "c" {
    name = "testfhirstore-c"
    dataset = "google_healthcare_dataset.c.id"
    version = "STU3"

    disable_resource_versioning = false
}
