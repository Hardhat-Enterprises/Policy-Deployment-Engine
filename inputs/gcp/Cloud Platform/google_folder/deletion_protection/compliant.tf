resource "google_folder" "compliant_example_1" {
  display_name        = "Compliant Folder"
  parent              = "organizations/1234567"
  deletion_protection = true   # ✅ Enforced
}

resource "google_folder" "compliant_example_2" {
  display_name        = "Department A Folder"
  parent              = "DepartmentA/1234567"
  deletion_protection = true   # ✅ Enforced
}

