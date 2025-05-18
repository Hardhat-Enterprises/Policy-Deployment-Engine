package terraform.gcp.security.kuber_engine.google_container_cluster.addons_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars


conditions := [

  # horizontal_pod_autoscaling
  [
    {
      "situation_description": "HPA is disabled, increasing risk of resource exhaustion or DoS attacks under high load.",
      "remedies": ["Set horizontal_pod_autoscaling.disabled = false"]
    },
    {
      "condition": "Horizontal Pod Autoscaling must be enabled",
      "attribute_path": ["addons_config", 0, "horizontal_pod_autoscaling", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ],

  # http_load_balancing
  [
    {
      "situation_description": "HTTP Load Balancing is disabled",
      "remedies": ["Set http_load_balancing.disabled = false"]
    },
    {
      "condition": "HTTP Load Balancing must be enabled",
      "attribute_path": ["addons_config", 0, "http_load_balancing", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ],

  # network_policy_config
  [
    {
      "situation_description": "Network Policy Addon is disabled",
      "remedies": ["Set network_policy_config.disabled = false"]
    },
    {
      "condition": "Network Policy must be enabled",
      "attribute_path": ["addons_config", 0, "network_policy_config", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ],

  # dns_cache_config 
    {
      "situation_description": "DNS Cache Addon is disabled",
      "remedies": ["Set dns_cache_config.enabled = true"]
    },
    {
      "condition": "DNS Cache Addon must be enabled",
      "attribute_path": ["addons_config", 0, "dns_cache_config", 0, "enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]



message := helpers.get_multi_summary(conditions, vars.variables).message


details := helpers.get_multi_summary(conditions, vars.variables).details
