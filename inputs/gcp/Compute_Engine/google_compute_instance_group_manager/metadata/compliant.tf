resource "google_compute_instance_group_manager" "compliant_example_1" {
  name               = "compliant-example-1"
  base_instance_name = "compliant-example-1"
  project            = "test-project"
  zone               = "australia-southeast1-a"

  version {
    instance_template = "https://www.googleapis.com/compute/v1/projects/fake-project/global/instanceTemplates/fake-template"
  }

  all_instances_config {
    metadata = {
      enable-oslogin          = "TRUE"
      block-project-ssh-keys  = "TRUE"
      serial-port-enable      = "FALSE"
    }
  }
}
