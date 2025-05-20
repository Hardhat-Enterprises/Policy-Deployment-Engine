package terraform.gcp.security.kuber_engine.google_container_cluster.dns_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [

  
  [
    {"situation_description" : "DNS provider is not set to CLOUD_DNS",
     "remedies": ["Set 'cluster_dns' to 'CLOUD_DNS' to enable modern Cloud DNS support."]},
    {
      "condition": "Check if cluster_dns is CLOUD_DNS",
      "attribute_path": ["dns_config", 0, "cluster_dns"],
      "values": ["CLOUD_DNS"],
      "policy_type": "whitelist"
    }
  ],


  [
    {"situation_description" : "Cluster DNS scope is not set to VPC_SCOPE",
     "remedies": ["Set 'cluster_dns_scope' to 'VPC_SCOPE' for correct DNS resolution."]},
    {
      "condition": "Check if cluster_dns_scope is VPC_SCOPE",
      "attribute_path": ["dns_config", 0, "cluster_dns_scope"],
      "values": ["VPC_SCOPE"],
      "policy_type": "whitelist"
    }
  ],

 
  [
    {"situation_description" : "DNS domain is not 'cluster.local'",
     "remedies": ["Set 'cluster_dns_domain' to 'cluster.local' to match GKE defaults."]},
    {
      "condition": "Check if cluster_dns_domain is cluster.local",
      "attribute_path": ["dns_config", 0, "cluster_dns_domain"],
      "values": ["cluster.local"],
      "policy_type": "whitelist"
    }
  ],
  
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
