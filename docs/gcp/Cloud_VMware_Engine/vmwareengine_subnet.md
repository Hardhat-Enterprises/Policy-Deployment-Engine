## 🛡️ Policy Deployment Engine: `vmwareengine_subnet`

This section provides a concise policy evaluation for the `vmwareengine_subnet` resource in GCP.

Reference: [Terraform Registry – vmwareengine_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_subnet)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_cidr_range` | The IP address range of the subnet in CIDR format. | true | true | The subnet CIDR range determines the IP address space used by the subnet. Approved CIDR ranges help prevent address overlap, routing issues, and deployment into unapproved network ranges. | 192.168.100.0/26 | 10.0.0.0/24 |
| `parent` | The resource name of the private cloud to create a new subnet in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud | true | true | The parent value determines which private cloud the subnet belongs to. Using an approved parent helps ensure that the subnet is created only inside a trusted and approved private cloud. | projects/599444694846/locations/us-west1-a/privateClouds/c | projects/599444694846/locations/us-west1-a/privateClouds/nc |
| `name` | The ID of the subnet. For userDefined subnets, this name should be in the format of "service-n", where n ranges from 1 to 5. | true | true | Subnet names should follow an approved naming standard so that subnets can be clearly identified, audited, and managed consistently. | c | nc |
