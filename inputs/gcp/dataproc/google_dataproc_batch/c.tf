resource "google_dataproc_batch" "c" {
  project  = "my-project-dataproc02"
  location = "us-central1"
  batch_id = "batch-c-example"

  pyspark_batch {
    main_python_file_uri = "gs://example-bucket-name/pi.py"
  }

  # Corrected: Use a 'runtime_config' block with a 'properties' map.
  runtime_config {
    properties = {
      # Compliant: Specifies the subnetwork.
      "spark.driver.extraClassPath" = "projects/my-project-dataproc02/regions/us-central1/subnetworks/example-subnet",
      # Compliant: Specifies the dedicated service account.
      "spark.yarn.submit.credentials.service.account" = "batch-sa-placeholder@my-project-dataproc02.iam.gserviceaccount.com"
    }
  }
}