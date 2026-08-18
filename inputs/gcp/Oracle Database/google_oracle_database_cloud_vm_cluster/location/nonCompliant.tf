resource "google_oracle_database_cloud_vm_cluster" "non_compliant_example_1" {
  cloud_vm_cluster_id    = "non-compliant-vm-cluster-1"
  location                = "us-central1"
  exadata_infrastructure  = "projects/fake-project/locations/us-central1/cloudExadataInfrastuctures/fake-exadata-infra-1"

  properties {
    cpu_core_count = 4
    license_type   = "LICENSE_INCLUDED"
  }
}
