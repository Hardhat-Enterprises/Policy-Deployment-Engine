# google_oracle_database_cloud_vm_cluster
# Label the resource(s) under test compliant_example_1, compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.
#
# location is set to an approved Australian region (australia-southeast1).
# All non-tested fields (including exadata_infrastructure, which is a fixed
# opaque reference) are identical to nonCompliant.tf so the only variable
# under test is location.

resource "google_oracle_database_cloud_vm_cluster" "compliant_example_1" {
  cloud_vm_cluster_id    = "compliant-vm-cluster-1"
  location                = "australia-southeast1"
  exadata_infrastructure  = "projects/fake-project/locations/australia-southeast1/cloudExadataInfrastuctures/fake-exadata-infra-1"

  properties {
    cpu_core_count = 4
    license_type   = "LICENSE_INCLUDED"
  }
}
