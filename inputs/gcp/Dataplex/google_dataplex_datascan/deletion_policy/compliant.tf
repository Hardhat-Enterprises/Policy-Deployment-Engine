resource "google_dataplex_datascan" "compliant_example_1" {
  location        = "australia-southeast1"
  data_scan_id    = "compliant-example-1"
  project         = "fake-project"
  deletion_policy = "PREVENT"

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
