package terraform.gcp.security.dataplex.google_dataplex_asset.discovery

import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

default details := []
default message := []

discovery_disabled[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type

  after := rc.change.after
  after.discovery_spec.enabled == false

  d := {
    "resource_address": rc.address,
    "attribute": "discovery_spec.enabled",
    "why": "Dataplex Asset must have discovery enabled"
  }
}

details := [d | d := discovery_disabled[_]]

message := ["Dataplex Asset must have discovery enabled"] if { count(details) > 0 }
