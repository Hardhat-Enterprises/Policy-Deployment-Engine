## 🛡️ Policy Deployment Engine: `chronicle_data_access_label`

This section provides a concise policy evaluation for the `chronicle_data_access_label` resource in GCP.

Reference: [Terraform Registry – chronicle_data_access_label](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_data_access_label)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `udm_query` | A UDM query over event data. | false | true | Improper UDM queries may include disallowed or malicious values, potentially leading to incorrect data access labeling or security misinterpretations. | principal.hostname="example.com" | principal.hostname="malicious.com" |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "australia-southeast1". | true | true | Restricting to allowed locations ensures compliance with regional data residency and service availability. | australia-southeast1 | europe-west3 |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `data_access_label_id` | Required. The ID to use for the data access label, which will become the label's display name and the final component of the label's resource name. The maximum number of characters should be 63. Regex pattern is as per AIP: https://google.aip.dev/122#resource-id-segments | true | true | Improper label IDs can violate naming standards and break automation workflows or policy mappings that rely on predictable resource names. | None | None |
| `description` | Optional. A description of the data access label for a human reader. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
