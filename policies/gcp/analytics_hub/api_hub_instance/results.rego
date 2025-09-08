package terraform.gcp.api_hub.api_hub_instance

import data.terraform.gcp.api_hub.api_hub_instance as api_hub

results = {
  "deny": [msg | msg := api_hub.deny[_]]
}
