# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
    name = "testdataset-c"
    location = "australia-southeast1"

    time_zone = "UTC+10:00"
    project = "project"
}
