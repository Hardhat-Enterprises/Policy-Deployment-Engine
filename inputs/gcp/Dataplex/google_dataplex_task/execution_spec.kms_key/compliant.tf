resource "google_dataplex_task" "compliant_example_1" {
    task_id = "compliant_example_1"
    location = "australia-southeat1"
    lake = "example-lake"
    project = "example-project"

    execution_spec {
        service_account = "task-runner@example-project.iam.gserviceaccount.com"
        kms_key = "projects/example-project/locations/australia-southeast1/keyRings/example-ring/cryptoKeys/example-key"
  }

  trigger_spec {
    type = "ON_DEMAND"
  }

   spark {                                                        
    python_script_file = "gs://example-bucket/scripts/example_job.py"   
  }                                                             
}