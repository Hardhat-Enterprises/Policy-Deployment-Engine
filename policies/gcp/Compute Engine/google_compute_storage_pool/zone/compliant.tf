resource "google_compute_storage_pool" "compliant_example_1" {
  name = "compliant_example_1"

  project = "pde-project-vindya"

  pool_provisioned_capacity_gb = "10240"
  pool_provisioned_throughput  = "100"

  storage_pool_type = "hyperdisk-throughput"

  zone = "australia-southeast1-a"
}