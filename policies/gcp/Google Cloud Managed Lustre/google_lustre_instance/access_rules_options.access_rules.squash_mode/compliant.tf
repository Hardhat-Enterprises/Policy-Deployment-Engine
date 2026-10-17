resource "google_lustre_instance" "compliant_example_1" {
  project                     = "fake-project"
  instance_id                 = "my-instance"
  location                    = "us-central1-a"
  description                 = "compliant_example_1"
  filesystem                  = "fs2"
  capacity_gib                = 18000
  network                     = "projects/fake-project/global/networks/network1"
  per_unit_storage_throughput = 1000

  gke_support_enabled = true

  access_rules_options {
    default_squash_gid  = 1000
    default_squash_mode = "ROOT_SQUASH"
    default_squash_uid  = 1000

    access_rules {
      name              = "secure_rule"
      ip_address_ranges = ["10.0.0.0/24"]
      squash_mode       = "ROOT_SQUASH"
    }
  }

  labels = {
    test = "value"
  }

  timeouts {
    create = "120m"
  }
}