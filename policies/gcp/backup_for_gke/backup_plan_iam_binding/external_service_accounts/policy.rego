package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.external_service_accounts
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := []

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
