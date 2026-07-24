resource "google_oracle_database_cloud_vm_cluster" "compliant_example_1" {
  # Required attributes
  cloud_vm_cluster_id     = "example-cluster-id"
  exadata_infrastructure  = "projects/my-project/locations/us-central1/exadataInfrastructures/example-infra"
  location                = "us-central1"

  cidr = "10.0.0.0/24"
}