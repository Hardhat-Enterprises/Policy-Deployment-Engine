resource "google_workstations_workstation_config" "non_compliant_example_1" {
  project                = "925810350503"
  workstation_config_id  = "non_compliant_example_1"
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
      machine_type                = "n1-standard-1"
      boot_disk_size_gb           = 35
      disable_public_ip_addresses = true
      disable_ssh                 = false

    }
  }
}
