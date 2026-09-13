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
      new_on_demand_instances {
        machine_type = "n2-standard-2"
        zone         = "australia-southeast1-a"
      }
    }
  }

  orchestrator {
    slurm {
      login_nodes {
        machine_type = "n2-standard-2"
        count        = 1
        zone         = "australia-southeast1-a"
      }

      node_sets {
        id                = "nodeset1"
        compute_id        = "compute1"
        static_node_count = 1
      }

      partitions {
        id           = "partition1"
        node_set_ids = ["nodeset1"]
      }

      default_partition = "partition1"
    }
  }
}