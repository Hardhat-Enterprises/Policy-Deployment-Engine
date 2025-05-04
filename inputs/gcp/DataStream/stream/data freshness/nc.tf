# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_datastream_stream" "nc" {
     project               = "your-gcp-project-id"
  display_name = "Salesforce to BigQuery"
  location     = "AU"
  stream_id    = ""

  source_config {
    source_connection_profile = "source-profile"
    postgresql_source_config {
        publication      = "publication"
        replication_slot = "replication_slot"
    }
  }

  destination_config {
    destination_connection_profile = "destination-profile"
    bigquery_destination_config {
      data_freshness = "1800s"
        source_hierarchy_datasets {
                dataset_template {
                   location = "us-central1"
                }
    }
  }
  }
  backfill_none {}
}