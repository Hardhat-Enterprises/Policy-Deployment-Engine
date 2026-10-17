resource "google_dataplex_datascan" "non_compliant_example_1" {
  location     = "australia-southeast1"
  data_scan_id = "non-compliant-service-account-example"
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
      email = "123456789012-compute@developer.gserviceaccount.com"
    }
  }

  data_profile_spec {}
}
