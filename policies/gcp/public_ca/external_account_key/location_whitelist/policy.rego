package terraform.gcp.security.public_ca.external_account_key.location_whitelist

# NOTE: Manual evaluation over resource_changes because helpers didn't resolve attribute_path for this plan.
import data.terraform.gcp.security.public_ca.external_account_key.location_whitelist.vars

approved := {"us-central1", "us-east1", "europe-west1"}

all_addrs := [addr |
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  addr := rc.address
]

bad_addrs := [addr |
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  loc := rc.change.after.location
  not approved[loc]
  addr := rc.address
]

non_compliant_label := "All passed" if { count(bad_addrs) == 0 }
non_compliant_label := concat(", ", bad_addrs) if { count(bad_addrs) > 0 }

ncr := ["All passed"] if { count(bad_addrs) == 0 }
ncr := bad_addrs        if { count(bad_addrs) > 0 }

message := [
  sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(all_addrs)]),
  [
    "Situation 1: External Account Key is created in a non-approved location.",
    sprintf("Non-Compliant Resources: %s", [non_compliant_label]),
    "Potential Remedies: Use an approved location (e.g., us-central1, us-east1, europe-west1)."
  ]
]

details := [d] if {
  d := {
    "situation": "External Account Key is created in a non-approved location.",
    "details": [
      { "location must be one of approved regions": bad_addrs }
    ],
    "non_compliant_resources": ncr,
    "remedies": [
      "Use an approved location (e.g., us-central1, us-east1, europe-west1)."
    ]
  }
}
