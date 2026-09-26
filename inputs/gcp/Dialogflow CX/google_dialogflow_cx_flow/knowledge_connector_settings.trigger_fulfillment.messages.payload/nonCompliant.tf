resource "google_dialogflow_cx_flow" "non_compliant_example_1" {
  parent          = "projects/pde-demo/locations/global/agents/00000000-0000-0000-0000-000000000001"
  display_name    = "non_compliant_example_1"
  deletion_policy = "PREVENT"

  knowledge_connector_settings {
    trigger_fulfillment {
      messages {
        payload = jsonencode({
          password = "changeme"
        })
      }
    }
  }
}

resource "google_dialogflow_cx_flow" "non_compliant_example_2" {
  parent          = "projects/pde-demo/locations/global/agents/00000000-0000-0000-0000-000000000001"
  display_name    = "non_compliant_example_2"
  deletion_policy = "PREVENT"

  knowledge_connector_settings {
    trigger_fulfillment {
      messages {
        payload = jsonencode({
          secret = "secret"
        })
      }
    }
  }
}

resource "google_dialogflow_cx_flow" "non_compliant_example_3" {
  parent          = "projects/pde-demo/locations/global/agents/00000000-0000-0000-0000-000000000001"
  display_name    = "non_compliant_example_3"
  deletion_policy = "PREVENT"

  knowledge_connector_settings {
    trigger_fulfillment {
      messages {
        payload = jsonencode({
          token = "token"
        })
      }
    }
  }
}

resource "google_dialogflow_cx_flow" "non_compliant_example_4" {
  parent          = "projects/pde-demo/locations/global/agents/00000000-0000-0000-0000-000000000001"
  display_name    = "non_compliant_example_4"
  deletion_policy = "PREVENT"

  knowledge_connector_settings {
    trigger_fulfillment {
      messages {
        payload = jsonencode({
          api_key = "changeme"
        })
      }
    }
  }
}
