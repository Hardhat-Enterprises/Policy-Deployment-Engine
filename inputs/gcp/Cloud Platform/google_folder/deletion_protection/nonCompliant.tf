resource "google_folder" "non_compliant_example_1" {
  display_name        = "Compliant Folder"
  parent              = "organizations/1234567"
  deletion_protection = false   # ❌ Should trigger policy violation
}

resource "google_folder" "non_compliant_example_2" {
  display_name        = "Department A Folder"
  parent              = "DepartmentA/1234567"
  deletion_protection = false   # ❌ Should trigger policy violation
}
