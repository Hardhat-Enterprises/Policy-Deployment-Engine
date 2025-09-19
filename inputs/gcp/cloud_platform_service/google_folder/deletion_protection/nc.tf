resource "google_folder" "NC1" {
  display_name        = "NonCompliant Folder"
  parent              = "organizations/1234567"
  deletion_protection = false   # ❌ Should trigger policy violation
}

resource "google_folder" "NC2" {
  display_name        = "Department B Folder"
  parent              = "DepartmentB/1234567"
  deletion_protection = false   # ❌ Should trigger policy violation
}
