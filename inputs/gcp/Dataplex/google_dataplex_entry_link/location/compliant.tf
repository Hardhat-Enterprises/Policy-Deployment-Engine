resource "google_dataplex_entry_link" "compliant_example_1" {
  entry_link_id   = "compliant_example_1"
  entry_group_id  = "example-entry-group"
  entry_link_type = "projects/dataplex-types/locations/global/entryLinkTypes/definition"
  location        = "australia-southeast1"
  project         = "fake-project"

  entry_references {
    name = "projects/fake-project/locations/australia-southeast1/entryGroups/example-entry-group/entries/entry-source"
    type = "SOURCE"
  }
  entry_references {
    name = "projects/fake-project/locations/australia-southeast1/entryGroups/example-entry-group/entries/entry-target"
    type = "TARGET"
  }
}