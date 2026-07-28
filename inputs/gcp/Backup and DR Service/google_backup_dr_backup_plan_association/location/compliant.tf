resource "google_backup_dr_backup_plan_association" "compliant_example_1" {
  project                    = "my-project-4418-1743628379470"
  location                   = "australia-southeast1"
  resource_type              = "compute.googleapis.com/Instance"
  backup_plan_association_id = "compliant_example_1"
  resource                   = "c2"
  backup_plan                = "c3"
}
