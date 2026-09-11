resource "google_dataplex_task" "non_compliant_example_1" {
  task_id  = "non_compliant_example_1"
  location = "australia-southeast1"
  lake     = "example-lake"
  project  = "example-project"

  execution_spec {
    service_account = "123456789012-compute@developer.gserviceaccount.com"
    kms_key         = "projects/example-project/locations/australia-southeast1/keyRings/example-ring/cryptoKeys/example-key"
  }

  trigger_spec {
    type = "ON_DEMAND"
  }

  spark {
    python_script_file = "gs://example-bucket/scripts/example_job.py"
  }
}
