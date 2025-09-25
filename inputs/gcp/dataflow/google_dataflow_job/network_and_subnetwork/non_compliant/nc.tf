provider "google" {
  project = "your-gcp-project"
  region  = "your-gcp-region"
}

resource "google_dataflow_job" "non_compliant_job_wrong_network" {
  name              = "non-compliant-dataflow-job-wrong-network"
  project           = "your-gcp-project"
  region            = "your-gcp-region"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://your-gcp-project-dataflow-temp/temp"
  network           = "projects/your-gcp-project/global/networks/wrong-dataflow-network"
  subnetwork        = "projects/your-gcp-project/regions/your-gcp-region/subnetworks/dataflow-subnet-prod"
}

resource "google_dataflow_job" "non_compliant_job_wrong_subnetwork" {
  name              = "non-compliant-dataflow-job-wrong-subnetwork"
  project           = "your-gcp-project"
  region            = "your-gcp-region"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://your-gcp-project-dataflow-temp/temp"
  network           = "projects/your-gcp-project/global/networks/dataflow-network-prod"
  subnetwork        = "projects/your-gcp-project/regions/your-gcp-region/subnetworks/wrong-dataflow-subnet"
}

resource "google_dataflow_job" "non_compliant_job_missing_network" {
  name              = "non-compliant-dataflow-job-missing-network"
  project           = "your-gcp-project"
  region            = "your-gcp-region"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://your-gcp-project-dataflow-temp/temp"
  subnetwork        = "projects/your-gcp-project/regions/your-gcp-region/subnetworks/your-allowed-subnetwork"
}

resource "google_dataflow_job" "non_compliant_job_missing_subnetwork" {
  name              = "non-compliant-dataflow-job-missing-subnetwork"
  project           = "your-gcp-project"
  region            = "your-gcp-region"
  template_gcs_path = "gs://dataflow-templates/latest/Word_Count"
  temp_gcs_location = "gs://your-gcp-project-dataflow-temp/temp"
  network           = "projects/your-gcp-project/global/networks/your-allowed-network"
}
