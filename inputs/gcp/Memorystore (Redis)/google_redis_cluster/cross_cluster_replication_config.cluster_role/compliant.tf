resource "google_redis_cluster" "compliant_example_1" {
  name        = "compliant-example-1"
  shard_count = 3
  region      = "australia-southeast1"

  psc_configs {
    network = "projects/pde-project-vindya/global/networks/default"
  }

  cross_cluster_replication_config {
    cluster_role = "SECONDARY"

    primary_cluster {
      cluster = "projects/pde-project-vindya/locations/australia-southeast1/clusters/primary-cluster"
    }
  }
}
