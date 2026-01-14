resource "google_bigquery_capacity_commitment" "nc" {
  capacity_commitment_id = "nc-commitment"
  location               = "us-west2"
  slot_count             = 100
  plan                   = "FLEX_FLAT_RATE"
  edition                = "ENTERPRISE"
}
