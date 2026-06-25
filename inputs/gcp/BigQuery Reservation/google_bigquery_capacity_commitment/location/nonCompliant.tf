resource "google_bigquery_capacity_commitment" "non_compliant_example_1" {
  capacity_commitment_id = "non_compliant_example_1"
  location               = "EU"
  slot_count             = 0
  plan                   = "FLEX_FLAT_RATE"
  edition                = "ENTERPRISE"
}
