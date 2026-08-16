# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_gkeonprem_vmware_admin_cluster" "non_compliant_example_1" {
  name                          = "non_compliant_example_1"
  location                      = "us-west1"
  description                   = "test admin cluster"
  bootstrap_cluster_membership  = "projects/870316890899/locations/global/memberships/gkeonprem-terraform-test"
  on_prem_version                = "1.31.0-gke.35"
  image_type                    = "ubuntu_containerd"
  annotations                   = {}
  vcenter {
    resource_pool = "test resource pool"
    datastore     = "test data store"
    datacenter    = "test data center"
    cluster       = "test cluster"
    folder        = "test folder"
    ca_cert_data  = "test ca cert data"
    address       = "10.0.0.1"
    data_disk     = "test data disk"
  }
  network_config {
    service_address_cidr_blocks = ["10.96.0.0/12"]
    pod_address_cidr_blocks     = ["192.168.0.0/16"]
    dhcp_ip_config {
      enabled = true
    }
  }
  control_plane_node {
    cpus   = 4
    memory = 8192
  }
  load_balancer {
    vip_config {
      control_plane_vip = "10.251.133.5"
      addons_vip         = "10.251.135.19"
    }
    f5_config {
      address   = "10.251.135.22"
      partition = "test-partition"
      snat_pool = "test-snat-pool"
    }
  }
  private_registry_config {
    address = "test-address"
    ca_cert = "test-ca-cert"
  }
  proxy {
    url      = "http://my-proxy.example.local:80"
    no_proxy = "10.151.222.0/24,my-host.example.local,10.151.2.1"
  }
}