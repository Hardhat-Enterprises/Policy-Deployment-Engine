resource "google_dataplex_task" "non_compliant_example_1" {
    task_id = "non_compliant_example_1"
    location = "australia-southeast1"
    lake = "example-lake"
    project = "example-project"

    execution_spec {
      service_account = "task-runner@example-project.iam.gserviceaccount.com"
    }

    trigger_spec {
      type = "ON_DEMAND"
    }

     spark {                                                        
    python_script_file = "gs://example-bucket/scripts/example_job.py"   
  }                                                             
}

resource "google_dataplex_task" "non_compliant_example_2" {
    task_id = "non_compliant_example_2"
    location = "australia-southeast1"
    lake = "example-lake"
    project = "example-project"

    execution_spec {
      service_account = "task-runner@example-project.iam.gserviceaccount.com"
      kms_key = "example-key"
    }

    trigger_spec {
      type = "ON_DEMAND"
    }

     spark {                                                        
    python_script_file = "gs://example-bucket/scripts/example_job.py"   
  }                                                             
}
