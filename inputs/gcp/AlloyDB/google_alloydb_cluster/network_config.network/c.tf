resource "google_alloydb_instance" "c_g0" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-c"
  instance_id   = "inst-no-public-ip"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  network_config { enable_public_ip = false }
}

resource "google_alloydb_cluster" "c_g1" {
  cluster_id = "c"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/prod-vpc"
  }

  initial_user {
    user     = "admin"
    password = "StrongPass1!"
  }
}
