resource "google_dataplex_datascan" "compliant_example_1" {
  location     = "australia-southeast1"
  data_scan_id = "compliant-table-type-example"
  project      = "fake-project"

  data {
    resource = "//storage.googleapis.com/projects/fake-project/buckets/example-bucket"
  }

  execution_spec {
    trigger {
      on_demand {}
    }
  }

  data_discovery_spec {
    bigquery_publishing_config {
      table_type = "BIGLAKE"
    }
  }
}
