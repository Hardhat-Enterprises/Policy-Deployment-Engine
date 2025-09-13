package terraform.gcp.security.oslogin.google_compute_instance.vars


variables := {
  "friendly_resource_name": "Compute Engine instance",
  "resource_type": "google_compute_instance",
  # 👇 Using zone avoids helper conflict with duplicate name
  "resource_value_name": "zone"
}
