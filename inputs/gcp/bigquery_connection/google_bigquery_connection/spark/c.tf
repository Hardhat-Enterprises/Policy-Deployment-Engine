resource "google_bigquery_connection" "c" {
  connection_id = "spark-conn-compliant"
  location      = "australia-southeast2"
  project       = "my-project"
  friendly_name = "compliant spark connection"
  description   = "Spark connection using approved AU Dataproc cluster"

  spark {
    spark_history_server_config {
      # Matches your whitelist exactly
      dataproc_cluster = "projects/my-project/regions/australia-southeast2/clusters/approved-cluster"
    }
  }
}
