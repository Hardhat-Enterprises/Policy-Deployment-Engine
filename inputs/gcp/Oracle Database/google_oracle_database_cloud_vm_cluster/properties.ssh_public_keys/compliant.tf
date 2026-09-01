resource "google_oracle_database_cloud_vm_cluster" "compliant_example_1" {
  cloud_vm_cluster_id    = "vm-cluster-example-1"
  location                = "australia-southeast1"
  exadata_infrastructure  = "projects/fake-project/locations/australia-southeast1/cloudExadataInfrastuctures/fake-exadata-infra-1"

  properties {
    cpu_core_count  = 4
    license_type    = "LICENSE_INCLUDED"
    ssh_public_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFakeKeyDataOnlyNotARealKey0000 fake-admin@example.com"]
  }
}
