resource "google_bigquery_analytics_hub_data_exchange" "nc_ex" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = "nc_exchange_iam"
  display_name     = "nc_exchange_iam"
  description      = "noncompliant exchange"
}

resource "google_bigquery_dataset" "nc_ds" {
  project      = "pde-test-project"
  dataset_id   = "nc_listing_iam_ds"
  location     = "australia-southeast1"
  description  = "dataset for noncompliant listing iam"
}

resource "google_bigquery_analytics_hub_listing" "nc" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc_ex.data_exchange_id
  listing_id       = "nc_listing_iam"
  display_name     = "nc_listing_iam"
  description      = "noncompliant listing"

  bigquery_dataset {
    dataset = google_bigquery_dataset.nc_ds.id
  }
}

resource "google_bigquery_analytics_hub_listing_iam_member" "nc" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_listing.nc.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.nc.listing_id

  role   = "roles/viewer"
  member = "allUsers"
}
