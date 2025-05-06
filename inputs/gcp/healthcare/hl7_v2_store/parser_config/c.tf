# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_hl7_v2_store" "c" {
    name = "testhl7v2store-c"
    dataset = "google_healthcare_dataset.c.id"

    parser_config {
    allow_null_header = false
    segment_terminator = base64encode("\r")
    version = "V1"
  }
}
