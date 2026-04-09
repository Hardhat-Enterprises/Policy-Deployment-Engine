resource "google_bigquery_connection" "nc_spark" {
  connection_id = "spark-conn-bad"
  location      = "US"
  project       = "my-project-nc"

  spark {
    spark_history_server_config {
      dataproc_cluster = "projects/my-project-nc/regions/us-central1/clusters/any-cluster"
    }
  }
}