package terraform.gcp.security.dataflow.google_dataflow_job.vars

variables := {
    "friendly_resource_name": "Dataflow Job",
    "resource_type": "google_dataflow_job",
    "resource_value_name" : "name",
    "allowed_network": "projects/your-gcp-project/global/networks/dataflow-network-prod",
    "allowed_subnetwork": "projects/your-gcp-project/regions/your-gcp-region/subnetworks/dataflow-subnet-prod"
}
