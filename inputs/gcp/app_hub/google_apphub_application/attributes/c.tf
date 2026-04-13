resource "google_apphub_application" "c1" {
  project        = "PDE"
  location       = "australia-southeast1"
  application_id = "c1"
  scope {
    type = "REGIONAL"
  }
  attributes {
    environment {
      type = "PRODUCTION"
    }
    criticality {
      type = "LOW"
    }
  }
}

resource "google_apphub_application" "c2" {
  project        = "PDE"
  location       = "australia-southeast1"
  application_id = "c2"
  scope {
    type = "REGIONAL"
  }
  attributes {
    environment {
      type = "PRODUCTION"
    }
    criticality {
      type = "MISSION_CRITICAL"
    }
  }
}

resource "google_apphub_application" "c3" {
  project        = "PDE"
  location       = "australia-southeast1"
  application_id = "c3"
  scope {
    type = "REGIONAL"
  }
  attributes {
    environment {
      type = "STAGING"
    }
    criticality {
      type = "MEDIUM"
    }
  }
}

resource "google_apphub_application" "c4" {
  project        = "PDE"
  location       = "australia-southeast1"
  application_id = "c4"
  scope {
    type = "REGIONAL"
  }
  attributes {
    environment {
      type = "DEVELOPMENT"
    }
    criticality {
      type = "LOW"
    }
  }
}
