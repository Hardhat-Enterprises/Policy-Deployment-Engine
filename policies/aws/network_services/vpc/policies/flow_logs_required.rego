package pde.aws.network_services.vpc.flow_logs_required

# -----------------------------------------------------------------------------
# Policy: VPC must have Flow Logs enabled
# Author: Rashed
# Framework: CIS AWS Foundations Benchmark v1.3 - Control 2.1
# -----------------------------------------------------------------------------

# Deny any VPC that does not have flow logs enabled
deny[msg] {
  some i
  input.resource_changes[i].type == "aws_vpc"
  not has_flow_logs(input.resource_changes[i].change.after)

  vpc_name := input.resource_changes[i].change.after.tags.Name
  msg := sprintf("VPC '%s' must have flow logs enabled", [vpc_name])
}

# Helper function: check if flow_logs attribute exists and is not null
has_flow_logs(vpc) {
  vpc.flow_logs != null
}
