resource "google_storage_insights_report_config" "nc" {
  location     = "europe-west8"
  display_name = "insecure-report-config"
  project      = "nc"
  csv_options {
    record_separator = "\n"
    delimiter        = ","
    header_required  = false
  }
  object_metadata_report_options {
    metadata_fields = ["bucket", "name", "project"]

    storage_destination_options {
      bucket           = "secure-report-bucket"
      destination_path = "storage-insights-reports"
    }
  }
}