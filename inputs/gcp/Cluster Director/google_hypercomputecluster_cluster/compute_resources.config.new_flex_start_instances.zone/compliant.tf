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

  compute_resources {
    id = "compute1"

    config {
      new_flex_start_instances {
        machine_type = "n2-standard-2"
        max_duration = "3600s"
        zone         = "australia-southeast1-a"
      }
    }
  }
}