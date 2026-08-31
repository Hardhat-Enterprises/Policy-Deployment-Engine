resource "google_gkeonprem_vmware_node_pool" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project = "PDE"
  location = "australia_southeast1"
  vmware_cluster = "c"
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
