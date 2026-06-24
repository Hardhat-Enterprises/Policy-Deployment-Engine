resource "google_alloydb_instance" "nc_g0" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-nc"
  instance_id   = "inst-public-ip"
  instance_type = "PRIMARY"
  gce_zone      = "us-east1-b"

  network_config { enable_public_ip = true }
}

resource "google_alloydb_cluster" "nc_g1" {
  cluster_id = "nc"
  location   = "us-central1"
  project = "123"

  network_config {
    network = "projects/pde-demo/global/networks/default"
  }

  initial_user {
    user     = "admin"
    password = "StrongPass1!"
  }
}
