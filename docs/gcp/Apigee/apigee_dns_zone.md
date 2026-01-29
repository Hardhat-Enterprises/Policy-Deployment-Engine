## 🛡️ Policy Deployment Engine: `apigee_dns_zone`

This section provides a concise policy evaluation for the `apigee_dns_zone` resource in GCP.

Reference: [Terraform Registry – apigee_dns_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_dns_zone)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | Doamin for the zone. | true | true | It serves as the identifier for a specific set of private DNS records that Apigee needs to access, such as internal backend service hostnames | None | None |
| `description` | Description for the zone. | true | false | It is the metadata used to describe zone and has no security impact | None | None |
| `peering_config` | Peering zone config Structure is [documented below](#nested_peering_config). | true | false | This configuration allows the Apigee runtime instances to resolve internal hostnames and access backend services | None | None |
| `org_id` | The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`. | true | false | It sets organization name and has no security impact | None | None |
| `dns_zone_id` | ID of the dns zone. | true | false | It acts as the key for a DNS peering configuration that tells Apigee how to resolve hostnames within a specific private DNS zone and does not necessary have security impact. | None | None |

### peering_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_project_id` | The ID of the project that contains the producer VPC network. | true | false | None | None | None |
| `target_network_id` | The name of the producer VPC network. | true | false | None | None | None |
