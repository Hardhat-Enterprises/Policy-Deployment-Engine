resource "google_hypercomputecluster_cluster" "compliant_example_1" {
  cluster_id      = "example1"
  location        = "us-central1"
  deletion_policy = "PREVENT"

  network_resources {
    id = "network1"

    config {
      new_network {
        description = "Cluster network"
        network     = "projects/example-project/global/networks/cluster-net1"
      }
    }
  }
}