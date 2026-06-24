resource "google_bigquery_capacity_commitment" "nc" {
  capacity_commitment_id = "nc"
  location               = "EU"
  slot_count             = 0
  plan                   = "FLEX_FLAT_RATE"
  edition                = "ENTERPRISE"
}
