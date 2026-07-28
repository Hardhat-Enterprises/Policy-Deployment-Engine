resource "google_storage_insights_report_config" "non_compliant_example_1" {
  location     = "australia-southeast1"
  display_name = "insecure-report-config"
  project      = "non_compliant_example_1"
  csv_options {
    record_separator = "\n"
    delimiter        = ","
    header_required  = false
  }
  frequency_options {
    frequency = "DAILY"

    start_date {
      day   = 1
      month = 6
      year  = 2026
    }

    end_date {
      day   = 1
      month = 6
      year  = 2027
    }
  }

  object_metadata_report_options {
    metadata_fields = ["bucket", "name", "project"]

    storage_destination_options {
      bucket           = "secure-report-bucket"
      destination_path = "storage-insights-reports"
    }
  }
}
