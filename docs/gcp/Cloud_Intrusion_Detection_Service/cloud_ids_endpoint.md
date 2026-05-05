## 🛡️ Policy Deployment Engine: `cloud_ids_endpoint`

This section provides a concise policy evaluation for the `cloud_ids_endpoint` resource in GCP.

Reference: [Terraform Registry – cloud_ids_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_ids_endpoint)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the endpoint in the format projects/{project_id}/locations/{locationId}/endpoints/{endpointId}. | true | false | Consistent naming improves resource management and identification. | projects/my-project/locations/australia-southeast1/endpoints/ids-prod | ids-test |
| `network` | Name of the VPC network that is connected to the IDS endpoint. | true | false | Using a properly configured network ensures effective monitoring and security. | projects/my-project/global/networks/private-vpc | default |
| `severity` | The minimum alert severity level that is reported by the endpoint. | true | false | Higher severity levels ensure critical threats are detected and reported. | HIGH | LOW |
| `location` | The location for the endpoint. | true | false | Choosing the correct location ensures compliance and better performance. | australia-southeast1 | europe-west1 |
| `description` | An optional description of the endpoint. | false | false | Providing a description improves clarity and documentation. | Production IDS endpoint |  |
| `threat_exceptions` | Configuration for threat IDs excluded from generating alerts. | false | false | Should be used carefully to avoid missing important threats. | ['safe-id'] | ['*'] |
| `project` | If not provided, the provider project is used. | false | false | Specifying the project ensures proper organization and access control. | test-project |  |
