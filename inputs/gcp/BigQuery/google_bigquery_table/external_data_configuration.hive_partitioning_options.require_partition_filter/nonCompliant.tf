resource "google_bigquery_table" "non_compliant_example_1" {
  project    = "PDE"
  dataset_id = "non_compliant_example_1"
  table_id   = "your_table_id"

  external_data_configuration {
    autodetect    = true
    source_format = "PARQUET"
    source_uris   = ["gs://example-bucket/path/*"]

    hive_partitioning_options {
      mode                     = "AUTO"
      source_uri_prefix        = "gs://example-bucket/path/"
      require_partition_filter = false
    }
  }
}
