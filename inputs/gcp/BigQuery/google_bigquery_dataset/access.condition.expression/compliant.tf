resource "google_bigquery_dataset" "compliant_example_1" {
  dataset_id = "compliant_example_1"
  project    = "PDE"
  location   = "australia-southeast1"

  access {
    role          = "READER"
    user_by_email = "user@example.com"

    condition {
      expression = "request.time < timestamp(\"2030-01-01T00:00:00Z\")"
    }
  }
}
