
resource "google_workstations_workstation_config" "c" {
  project                = "925810350503"
  workstation_config_id  = "workstation-config"
  workstation_cluster_id = "workstation-cluster"
  location               = "us-central1"

  idle_timeout    = "600s"
  running_timeout = "21600s"

  replica_zones = ["us-central1-a", "us-central1-b"]
  annotations = {
    label-one = "value-one"
  }

  labels = {
    "label" = "key"
  }

  max_usable_workstations = 1

  host {
    gce_instance {
      machine_type                = "e2-standard-4"
      boot_disk_size_gb           = 35
      disable_public_ip_addresses = true
      disable_ssh                 = false

    }
  }
}