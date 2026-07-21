resource "google_dataplex_task" "non_compliant_example_1" {
    task_id = "non_compliant_example1"
    location = "us-central1"
    lake = "example-lake"
    project = "example-project"

    execution_spec {
      service_account = "task-runner@example-project.iam.gserviceaccount.com"
      kms_key         = "projects/example-project/locations/us-central1/keyRings/example-ring/cryptoKeys/example-key"
  }
  trigger_spec {
    type = "ON_DEMAND"
  }

 spark {                                                        
    python_script_file = "gs://example-bucket/scripts/example_job.py"   
  }                                                             
}