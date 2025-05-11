package terraform.gcp.security.azurecluster.cluster.fleet_project_whitelist

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
