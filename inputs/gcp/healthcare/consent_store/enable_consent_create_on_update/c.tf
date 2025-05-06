# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_consent_store" "c" {
    name = "testconsentstore-c"
    dataset = "google_healthcare_dataset.c.id"

    enable_consent_create_on_update = "true"
}
