resource "google_data_loss_prevention_job_trigger" "compliant_example_1" {
  parent          = "projects/example-project/locations/australia-southeast1"
  status          = "HEALTHY"
  deletion_policy = "PREVENT"

  triggers {
    schedule {
      recurrence_period_duration = "86400s"
    }
  }

  inspect_job {
    storage_config {
      big_query_options {
        table_reference {
          project_id = "example-project"
          dataset_id = "example_dataset"
          table_id   = "example_table"
        }


      }
    }
  }
}
