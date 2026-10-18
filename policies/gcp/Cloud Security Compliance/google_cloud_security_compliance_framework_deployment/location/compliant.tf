resource "google_cloud_security_compliance_framework_deployment" "compliant_example_1" {
  framework_deployment_id = "compliant-example-1"
  location                = "australia-southeast2"
  parent                  = "organizations/123456789"

  framework {
    framework         = "organizations/123456789/locations/global/frameworks/example-framework"
    major_revision_id = "1"
  }

  cloud_control_metadata {
    enforcement_mode = "PREVENTIVE"

    cloud_control_details {
      name              = "organizations/123456789/locations/global/cloudControls/example-control"
      major_revision_id = "1"
    }
  }

  target_resource_config {
    existing_target_resource = "organizations/123456789"
  }
}