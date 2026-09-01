# google_oracle_database_cloud_vm_cluster
# Label the resource(s) under test non_compliant_example_1, non_compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.
#
# local_backup_enabled is set to false so the cluster has no local backup to
# recover from after a destructive event. All non-tested fields are
# identical to compliant.tf so the only variable under test is
# local_backup_enabled.

resource "google_oracle_database_cloud_vm_cluster" "non_compliant_example_1" {
  cloud_vm_cluster_id    = "non-compliant-vm-cluster-1"
  location                = "australia-southeast1"
  exadata_infrastructure  = "projects/fake-project/locations/australia-southeast1/cloudExadataInfrastuctures/fake-exadata-infra-1"

  properties {
    cpu_core_count       = 4
    license_type         = "LICENSE_INCLUDED"
    local_backup_enabled = false
  }
}
