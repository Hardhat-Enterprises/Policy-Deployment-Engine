# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_deployment_manager_deployment" "nc" {
    name = "deployment-nc"

  target {
    config {
      content = <<EOF
imports:
- path: service_account.jinja
- path: vm.jinja

resources:
- name: &SA_NAME my-vm-account
  type: service_account.jinja
- name: my-vm
  type: vm.jinja
  properties:
    serviceAccountId: *SA_NAME
EOF
    }
  }

  create_policy = "CREATE_OR_ACQUIRE"
}