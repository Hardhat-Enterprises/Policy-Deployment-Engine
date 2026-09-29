resource "google_dataplex_datascan" "non_compliant_example_1" {
  location     = "australia-southeast1"
  data_scan_id = "non-compliant-table-type-example"
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
      table_type = "TABLE_TYPE_UNSPECIFIED"
    }
  }
}
