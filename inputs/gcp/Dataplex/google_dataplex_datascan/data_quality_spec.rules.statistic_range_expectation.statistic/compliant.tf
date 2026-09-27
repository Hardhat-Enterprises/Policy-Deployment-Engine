resource "google_dataplex_datascan" "compliant_example_1" {
  location     = "australia-southeast1"
  data_scan_id = "compliant-statistic-example"
  project      = "fake-project"

  data {
    resource = "//bigquery.googleapis.com/projects/bigquery-public-data/datasets/austin_bikeshare/tables/bikeshare_stations"
  }

  execution_spec {
    trigger {
      on_demand {}
    }
  }

  data_quality_spec {
    rules {
      column    = "number_of_docks"
      dimension = "VALIDITY"

      statistic_range_expectation {
        statistic          = "MEAN"
        min_value          = 5
        max_value          = 15
        strict_min_enabled = true
        strict_max_enabled = true
      }
    }
  }
}
