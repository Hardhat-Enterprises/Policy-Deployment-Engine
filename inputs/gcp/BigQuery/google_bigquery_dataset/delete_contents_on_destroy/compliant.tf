resource "google_bigquery_dataset" "compliant_example_1" {
  dataset_id = "dataset_policy_test"

  delete_contents_on_destroy = false
}
