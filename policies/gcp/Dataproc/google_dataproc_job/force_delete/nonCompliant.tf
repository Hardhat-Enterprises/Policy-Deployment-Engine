resource "google_dataproc_job" "non_compliant_example_1" {
  project      = "ecstatic-device-491708-g4"
  region       = "australia-southeast1"
  force_delete = true

  placement {
    cluster_name = "pde-example-cluster"
  }

  pyspark_config {
    main_python_file_uri = "gs://pde-example-bucket/jobs/example.py"
  }
}
