resource "google_bigquery_analytics_hub_data_exchange" "c_ex" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = "c_exchange_iam"
  display_name     = "c_exchange_iam"
  description      = "compliant exchange"
}

resource "google_bigquery_dataset" "c_ds" {
  project      = "pde-test-project"
  dataset_id   = "c_listing_iam_ds"
  location     = "australia-southeast1"
  description  = "dataset for compliant listing iam"
}

resource "google_bigquery_analytics_hub_listing" "c" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c_ex.data_exchange_id
  listing_id       = "c_listing_iam"
  display_name     = "c_listing_iam"
  description      = "compliant listing"

  bigquery_dataset {
    dataset = google_bigquery_dataset.c_ds.id
  }
}

resource "google_bigquery_analytics_hub_listing_iam_member" "c" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_listing.c.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.c.listing_id

  role   = "roles/viewer"
  member = "user:testuser@example.com"
}
