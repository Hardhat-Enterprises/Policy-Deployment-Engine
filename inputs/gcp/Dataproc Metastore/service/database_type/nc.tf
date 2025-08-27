# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_dataproc_metastore_service" "nc" {
  service_id = "_metastore-srv"
  database_type = "SPANNER" #not a compliant database type
  project = 1


}