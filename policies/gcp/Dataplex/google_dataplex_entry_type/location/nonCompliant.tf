# copied from compliant.tf, altered for non-compliance

resource "google_dataplex_entry_type" "non_compliant_example_1" {
    entry_type_id = "non_compliant_example_1"
    location = "ap-northeast3" #any location that is not stated within the whitelist 
    project = "exampleProject"
}