resource "google_dataplex_datascan" "non_compliant_example_1" {
  location     = "australia-southeast1"
  data_scan_id = "non-compliant-discovery-location-example"
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
      location = "us-central1"
    }
  }
}
