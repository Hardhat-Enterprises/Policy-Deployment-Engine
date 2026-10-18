resource "google_dataplex_datascan" "non_compliant_example_1" {
  location     = "us-central1"
  data_scan_id = "non-compliant-location-example"
  project      = "fake-project"

  data {
    resource = "//bigquery.googleapis.com/projects/bigquery-public-data/datasets/samples/tables/shakespeare"
  }

  execution_spec {
    trigger {
      on_demand {}
    }
  }

  data_profile_spec {}
}
