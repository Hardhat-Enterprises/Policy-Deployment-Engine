package terraform.gcp.security.azurecluster.cluster.fleet_project_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.vars

default summary = {
  "message": []
}

deny[r] {
  helpers.resource_type_match(r, "google_container_azure_cluster")
  not helpers.has_key(r.values, "fleet")
}

deny[r] {
  helpers.resource_type_match(r, "google_container_azure_cluster")
  r.values.fleet.project != vars.allowed_fleet_projects[_]
}

summary["message"] = helpers.summary_with_violations(
  "GCP Azure Cluster",
  "Fleet project must be in allowed list",
  deny,
  [r.values.name | r := deny]
)



/* package terraform.gcp.security.azurecluster.cluster.fleet_project_whitelist

resource_type := "google_container_azure_cluster"
friendly_resource_name := "GCP Azure Cluster"
approved_fleet_projects := ["secure-project-1", "prod-fleet-project", "approved-fleet"]

resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == resource_type
]

violations := [v |
  r := resources[_]
  not r.values.fleet.project in approved_fleet_projects
  v := sprintf("%s '%s' uses unapproved fleet project: '%s'", [friendly_resource_name, r.values.name, r.values.fleet.project])
]

summary.message := concat(", ", array.concat(
  [
    sprintf("Total %s detected: %d", [friendly_resource_name, count(resources)]),
    sprintf("Non-compliant %s: %d/%d", [friendly_resource_name, count(violations), count(resources)])
  ],
  violations
))
*/