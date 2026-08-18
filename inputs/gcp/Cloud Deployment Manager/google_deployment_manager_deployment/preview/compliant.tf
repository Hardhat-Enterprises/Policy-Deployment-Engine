resource "google_deployment_manager_deployment" "compliant_example_1" {
  name = "compliant_example_1"

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

  preview = false
}
