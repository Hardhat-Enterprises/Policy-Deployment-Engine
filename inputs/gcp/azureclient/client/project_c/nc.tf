# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_container_azure_client" "nc" {
    name = "client-nc"
    location = "us-central1"  # Not allowed (must be australia-southeast1)
    tenant_id = "insecure-tenant" # Simulated weak input
    application_id = "missing-tenant-id"

    project = true

}