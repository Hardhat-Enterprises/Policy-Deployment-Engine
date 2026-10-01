resource "google_dataplex_datascan" "compliant_example_1" {
  location     = "australia-southeast1"
  data_scan_id = "compliant-service-account-example"
  project      = "fake-project"

  data {
    resource = "//bigquery.googleapis.com/projects/bigquery-public-data/datasets/samples/tables/shakespeare"
  }

  execution_spec {
    trigger {
      on_demand {}
    }
  }

  execution_identity {
    service_account {
      email = "dataplex-scan@fake-project.iam.gserviceaccount.com"
    }
  }

  data_profile_spec {}
}
