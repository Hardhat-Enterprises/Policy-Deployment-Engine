provider "google" {
  project = "your-gcp-project"
  region  = "your-gcp-region"
}

resource "google_dataflow_job" "compliant_job" {
  name              = "compliant-dataflow-job"
  project           = "your-gcp-project"
  region            = "your-gcp-region"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://your-gcp-project-dataflow-temp/temp"
  network           = "projects/your-gcp-project/global/networks/dataflow-network-prod"
  subnetwork        = "projects/your-gcp-project/regions/your-gcp-region/subnetworks/dataflow-subnet-prod"
}
