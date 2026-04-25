# Healthcare Pipeline Job — labels attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-fhir-store"
  version = "R4"
}

resource "google_healthcare_pipeline_job" "nc" {
  name     = "nc-pipeline-job"
  location = "australia-southeast1"
  dataset  = google_healthcare_dataset.nc.id

  disable_lineage = false

  # VIOLATION: Missing required labels — owner, cost-center, compliance
  # VIOLATION: environment = "debug" — not in approved allowlist
  # VIOLATION: data-classification = "public" — not in {phi, restricted}
  labels = {
    environment         = "debug"
    data-classification = "public"
  }

  reconciliation_pipeline_job {
    fhir_store_destination = google_healthcare_fhir_store.nc.id
    matching_uri_prefix    = "gs://my-bucket/matching/"
    merge_config {
      description = "Merge config for reconciliation"
      whistle_config_source {
        uri               = "gs://my-bucket/merge.wstl"
        import_uri_prefix = "gs://my-bucket/"
      }
    }
  }
}
