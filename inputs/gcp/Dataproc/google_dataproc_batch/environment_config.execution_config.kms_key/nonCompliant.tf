resource "google_dataproc_batch" "non_compliant_example_1" {
  project  = "test-project"
  location = "australia-southeast1"

  pyspark_batch {
    main_python_file_uri = "gs://test-bucket/main.py"
  }

  environment_config {
    execution_config {
      kms_key = "projects/test-project/locations/us-central1/keyRings/test-ring/cryptoKeys/test-key"
    }
  }
}
