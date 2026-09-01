# google_oracle_database_cloud_vm_cluster
# Label the resource(s) under test compliant_example_1, compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.
#
# ssh_public_keys contains a well-formed SSH public key (fake key data,
# standard ssh-ed25519 format). All non-tested fields are identical to
# nonCompliant.tf so the only variable under test is ssh_public_keys.

resource "google_oracle_database_cloud_vm_cluster" "compliant_example_1" {
  cloud_vm_cluster_id    = "compliant-vm-cluster-1"
  location                = "australia-southeast1"
  exadata_infrastructure  = "projects/fake-project/locations/australia-southeast1/cloudExadataInfrastuctures/fake-exadata-infra-1"

  properties {
    cpu_core_count  = 4
    license_type    = "LICENSE_INCLUDED"
    ssh_public_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFakeKeyDataOnlyNotARealKey0000 fake-admin@example.com"]
  }
}
