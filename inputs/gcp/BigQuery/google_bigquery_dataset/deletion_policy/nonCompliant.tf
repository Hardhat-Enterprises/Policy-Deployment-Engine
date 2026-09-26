resource "google_bigquery_dataset" "non_compliant_example_1" {
  dataset_id = "non_compliant_example_1"

  deletion_policy = "DELETE"
}
