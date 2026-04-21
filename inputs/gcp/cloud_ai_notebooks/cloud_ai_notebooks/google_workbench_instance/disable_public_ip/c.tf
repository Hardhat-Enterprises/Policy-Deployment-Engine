resource "google_workbench_instance" "c1" {
  project = "my-secure-project" 
  name     = "workbench-instance"
  location = "us-central1-a"
  gce_setup {
    machine_type = "n1-standard-4"
    accelerator_configs {
      type       = "NVIDIA_TESLA_T4"
      core_count = 1
    }
    shielded_instance_config {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
    confidential_instance_config {
      confidential_instance_type = "SEV"
    }

    disable_public_ip = true

    service_accounts {
      email = "my@service-account.com"
    }
    boot_disk {
      disk_size_gb    = 310
      disk_type       = "PD_SSD"
      disk_encryption = "CMEK"
      kms_key         = "my-crypto-key"
    }
    data_disks {
      disk_size_gb    = 330
      disk_type       = "PD_SSD"
      disk_encryption = "CMEK"
      kms_key         = "my-crypto-key"
    }
    network_interfaces {
      network  = "wbi-test-default"
      subnet   = "wbi-test-default"
      nic_type = "GVNIC"
    }
    metadata = {
      terraform                    = "true"
      serial-port-logging-enable   = "false"
      "enable-jupyterlab4"         = "false"
      "notebook-disable-root"      = "true"
      "notebook-disable-downloads" = "true"
      "notebook-disable-terminal"  = "true"
      "block-project-ssh-keys"     = "true"
      "idle-timeout-seconds"       = "3600"
    }
    enable_ip_forwarding = false
    tags                 = ["abc", "def"]
  }
  disable_proxy_access        = "false"
  enable_managed_euc          = true
  instance_owners             = ["example@example.com"]
  labels = {
    k = "val"
  }
  desired_state               = "ACTIVE"
  enable_third_party_identity = "false"
}
