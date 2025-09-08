resource "google_container_analysis_note" "nc" {
  name = "BadNote!"                # ❌ Invalid characters in name
  short_description = ""           # ❌ Missing useful description
  long_description  = ""           # ❌ Missing useful description
  expiration_time   = "2000-01-01T00:00:00Z" # ❌ Expired

  related_url {
    url = "insecure-url"           # ❌ Not a valid https URL
  }

  attestation_authority {
    hint {
      human_readable_name = ""     # ❌ Missing human-readable name
    }
  }
}
