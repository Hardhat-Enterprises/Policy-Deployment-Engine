# Healthcare Pipeline Job — labels attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-fhir-store"
  version = "R4"
}

resource "google_healthcare_pipeline_job" "c" {
  name     = "compliant-pipeline-job"
  location = "australia-southeast1"
  dataset  = google_healthcare_dataset.c.id

  disable_lineage = false

  # COMPLIANT: all required labels present with approved values
  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }

  reconciliation_pipeline_job {
    fhir_store_destination = google_healthcare_fhir_store.c.id
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
