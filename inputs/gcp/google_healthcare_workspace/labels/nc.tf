# Healthcare Workspace — labels attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_workspace" "nc" {
  name    = "nc-workspace"
  dataset = google_healthcare_dataset.nc.id

  # VIOLATION: Missing required labels — owner, cost-center, compliance
  # VIOLATION: environment = "debug" — not in approved allowlist
  # VIOLATION: data-classification = "public" — not in {phi, restricted}
  labels = {
    environment         = "debug"
    data-classification = "public"
  }
}
