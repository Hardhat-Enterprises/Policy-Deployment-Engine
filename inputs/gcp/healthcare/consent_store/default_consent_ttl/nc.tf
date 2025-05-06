# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_consent_store" "nc" {
    name = "testconsentstore-nc"
    dataset = "google_healthcare_dataset.nc.id"

    default_consent_ttl = "3600s"
}