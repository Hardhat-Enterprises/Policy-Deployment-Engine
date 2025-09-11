resource "google_bigquery_connection" "nc" {
  connection_id = "spark-conn-noncompliant"
  location      = "australia-southeast2"
  project       = "my-project-nc"

  spark {
    spark_history_server_config {
      dataproc_cluster = "projects/my-project-nc/regions/australia-southeast2/clusters/other-cluster"
    }
  }
}
