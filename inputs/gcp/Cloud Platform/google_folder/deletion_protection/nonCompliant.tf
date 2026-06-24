resource "google_folder" "non_compliant_example_1" {
  display_name        = "NonCompliant Folder"
  parent              = "organizations/1234567"
  deletion_protection = false   # ❌ Should trigger policy violation
}

resource "google_folder" "non_compliant_example_2" {
  display_name        = "Department B Folder"
  parent              = "DepartmentB/1234567"
  deletion_protection = false   # ❌ Should trigger policy violation
}
