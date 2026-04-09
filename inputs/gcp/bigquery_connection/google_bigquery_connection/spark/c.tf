
resource "google_bigquery_connection" "c_spark" {
  connection_id = "spark-conn-ok"
  location      = "australia-southeast2"
  project       = "my-project-c"

  spark {
    spark_history_server_config {
      dataproc_cluster = "projects/my-project-c/regions/australia-southeast2/clusters/approved-cluster"
    }
  }
}