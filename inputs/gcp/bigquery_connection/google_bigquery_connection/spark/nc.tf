resource "google_bigquery_connection" "nc" {
  connection_id = "spark-conn-noncompliant"
  location      = "us"
  project       = "my-project-nc"
  friendly_name = "non-compliant spark connection"
  description   = "Spark connection pointing to non-AU Dataproc cluster"

  spark {
    spark_history_server_config {
      # Does NOT match the AU whitelist (intentionally wrong)
      dataproc_cluster = "projects/my-project-nc/regions/us-central1/clusters/history-srv"
    }
  }
}
