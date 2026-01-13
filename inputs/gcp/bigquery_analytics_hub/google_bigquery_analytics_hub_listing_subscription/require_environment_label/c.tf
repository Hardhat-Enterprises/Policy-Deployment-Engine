resource "google_bigquery_analytics_hub_data_exchange" "c_ex" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = "c_ex_ls"
  display_name     = "c_ex_ls"
  description      = "exchange for compliant listing subscription"
}

resource "google_bigquery_dataset" "c_src_ds" {
  project     = "pde-test-project"
  dataset_id  = "c_ls_src_ds"
  location    = "australia-southeast1"
  description = "source dataset for compliant listing subscription"
}

resource "google_bigquery_analytics_hub_listing" "c_listing" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c_ex.data_exchange_id
  listing_id       = "c_listing_ls"
  display_name     = "c_listing_ls"
  description      = "listing for compliant listing subscription"

  bigquery_dataset {
    dataset = google_bigquery_dataset.c_src_ds.id
  }
}

resource "google_bigquery_analytics_hub_listing_subscription" "c" {
  project         = "pde-test-project"
  location        = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c_ex.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.c_listing.listing_id

  destination_dataset {
    description   = "compliant subscription"
    friendly_name = "c_subscription_dest"
    location      = "australia-southeast1"

    labels = {
      environment = "development"
    }

    dataset_reference {
      project_id = "pde-test-project"
      dataset_id = "c_ls_dest_ds"
    }
  }
}
