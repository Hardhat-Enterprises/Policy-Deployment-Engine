data "google_iam_policy" "nc" {
  binding {
    role = "roles/gkebackup.restorePlanAdmin"
    members = [
      "allUsers",  # Non-compliant: public access
      "allAuthenticatedUsers"  # Non-compliant: overly broad
    ]
  }
}

resource "google_gke_backup_restore_plan_iam_policy" "nc" {
  name            = "nc"
  project         = "test-project"
  location        = "australia-southeast1"
  policy_data     = data.google_iam_policy.nc.policy_data
}