# google_compute_instance_group_manager: all_instances_config.metadata
# Non-compliant: example 1 disables OS Login (and includes a plaintext-looking
# secret); example 2 re-enables project-wide SSH keys; example 3 enables the
# serial console. Each covers a different situation in the policy.

resource "google_compute_instance_group_manager" "non_compliant_example_1" {
  name               = "non-compliant-example-1"
  base_instance_name = "non-compliant-example-1"
  project            = "test-project"
  zone               = "australia-southeast1-a"

  version {
    instance_template = "https://www.googleapis.com/compute/v1/projects/fake-project/global/instanceTemplates/fake-template"
  }

  all_instances_config {
    metadata = {
      enable-oslogin          = "FALSE"
      block-project-ssh-keys  = "FALSE"
      serial-port-enable      = "TRUE"
      password                = "Secretpassword123"
    }
  }
}


