resource "google_oracle_database_cloud_vm_cluster" "non_compliant_example_1" {
  cloud_vm_cluster_id  = "example-cluster-id"
  location             = "us-central1"
  exadata_infrastructure = "example-exadata-infrastructure"
  cidr                 = "0.0.0.0/0"
}
