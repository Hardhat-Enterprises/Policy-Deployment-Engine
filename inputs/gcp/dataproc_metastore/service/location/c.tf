# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  location = "australia-southeast2"
  project = 1


}
