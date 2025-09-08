## 🛡️ Policy Deployment Engine: `chronicle_data_access_label`

This section provides a concise policy evaluation for the `chronicle_data_access_label` resource in GCP.

Reference: [Terraform Registry – chronicle_data_access_label](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_data_access_label)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `udm_query` | A UDM query over event data. | true | None | None |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | None | None |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | None | None |
| `data_access_label_id` | Required. The ID to use for the data access label, which will become the label's display name and the final component of the label's resource name. The maximum number of characters should be 63. Regex pattern is as per AIP: https://google.aip.dev/122#resource-id-segments | true | None | None |
| `description` | Optional. A description of the data access label for a human reader. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
