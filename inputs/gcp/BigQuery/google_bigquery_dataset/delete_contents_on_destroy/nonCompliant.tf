resource "google_bigquery_dataset" "non_compliant_example_1" {
  dataset_id = "dataset_policy_test"

  delete_contents_on_destroy = true
}
