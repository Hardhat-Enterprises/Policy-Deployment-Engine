resource "google_redis_cluster" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  shard_count = 3
  region      = "us-central1"

  psc_configs {
    network = "projects/pde-project-vindya/global/networks/default"
  }


}
