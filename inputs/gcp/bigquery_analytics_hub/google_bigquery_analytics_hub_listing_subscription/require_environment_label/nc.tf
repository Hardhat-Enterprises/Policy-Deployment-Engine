resource "google_bigquery_analytics_hub_data_exchange" "nc_ex" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = "nc_ex_ls"
  display_name     = "nc_ex_ls"
  description      = "exchange for noncompliant listing subscription"
}

resource "google_bigquery_dataset" "nc_src_ds" {
  project     = "pde-test-project"
  dataset_id  = "nc_ls_src_ds"
  location    = "australia-southeast1"
  description = "source dataset for noncompliant listing subscription"
}

resource "google_bigquery_analytics_hub_listing" "nc_listing" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc_ex.data_exchange_id
  listing_id       = "nc_listing_ls"
  display_name     = "nc_listing_ls"
  description      = "listing for noncompliant listing subscription"

  bigquery_dataset {
    dataset = google_bigquery_dataset.nc_src_ds.id
  }
}

resource "google_bigquery_analytics_hub_listing_subscription" "nc" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc_ex.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.nc_listing.listing_id

  destination_dataset {
    description   = "noncompliant subscription"
    friendly_name = "nc_subscription_dest"
    location      = "australia-southeast1"

    # missing environment label
    labels = {
      owner = "team-a"
    }

    dataset_reference {
      project_id = "pde-test-project"
      dataset_id = "nc_ls_dest_ds"
    }
  }
}
