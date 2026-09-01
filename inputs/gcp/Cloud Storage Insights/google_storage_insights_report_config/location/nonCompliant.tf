resource "google_storage_insights_report_config" "non_compliant_example_1" {
  location     = "europe-west8"
  display_name = "secure-report-config"
  project      = "non_compliant_example_1"
  csv_options {
    record_separator = "\n"
    delimiter        = ","
    header_required  = true
  }
  object_metadata_report_options {
    metadata_fields = ["bucket", "name", "project"]

    storage_destination_options {
      bucket           = "secure-report-bucket"
      destination_path = "storage-insights-reports"
    }
  }
}
