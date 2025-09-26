resource "google_dataproc_batch" "nc" {
  project  = "my-project-dataproc02"
  location = "us-central1"
  batch_id = "nc"

  pyspark_batch {
    main_python_file_uri = "gs://example-bucket-name/pi.py"
  }

  # VIOLATION: The required 'runtime_config' block is missing,
  # so it will use the default service account and network.
}