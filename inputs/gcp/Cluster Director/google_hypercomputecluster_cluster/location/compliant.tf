resource "google_hypercomputecluster_cluster" "compliant_example_1" {
  cluster_id = "example1"
  location   = "australia-southeast1"

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