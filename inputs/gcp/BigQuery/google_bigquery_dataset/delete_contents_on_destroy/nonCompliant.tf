resource "google_bigquery_dataset" "non_compliant_example_1" {
  dataset_id = "non_compliant_example_1"

  delete_contents_on_destroy = true
}
