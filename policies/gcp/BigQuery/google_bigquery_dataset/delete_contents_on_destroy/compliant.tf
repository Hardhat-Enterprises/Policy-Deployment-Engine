resource "google_bigquery_dataset" "compliant_example_1" {
  dataset_id = "compliant_example_1"

  delete_contents_on_destroy = false
}
