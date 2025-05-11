# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_datastream_stream" "nc" {
project  = "your-gcp-project-id.nc"
  display_name = "Salesforce to BigQuery"
  location     = "australia-southeast1"
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
   gcs_destination_config {
            path = "mydata"
            file_rotation_mb = 750
            file_rotation_interval = "670s"
            json_file_format {
                schema_file_format = "NO_SCHEMA_FILE"
                compression = "GZIP"
            }
        }

    }
      backfill_all {}
  }
  
  


