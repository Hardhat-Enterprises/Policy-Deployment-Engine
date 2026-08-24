resource "google_compute_instance_group_manager" "non_compliant_example_1" {
  name               = "non-compliant-example-1"
  base_instance_name = "non-compliant-example-1"
  project            = "test-project"
  zone               = "australia-southeast1-a"
  deletion_policy    = "DELETE"

  version {
    instance_template = "https://www.googleapis.com/compute/v1/projects/fake-project/global/instanceTemplates/fake-template"
  }
}
