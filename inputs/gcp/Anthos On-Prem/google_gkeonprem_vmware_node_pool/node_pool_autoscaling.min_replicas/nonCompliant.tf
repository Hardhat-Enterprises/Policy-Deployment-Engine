resource "google_gkeonprem_vmware_node_pool" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project = "PDE"
  location = "us_west1"
  vmware_cluster = "nc"
  on_prem_version = "1.33.0-gke.35"
  config {
    image_type = "ubuntu_containerd"
    taints {
        key = "key"
        value = "value"
    }
    taints {
        key = "key"
        value = "value"
    }
  }
  node_pool_autoscaling {
    min_replicas = 0
    max_replicas = 10
  }
}
