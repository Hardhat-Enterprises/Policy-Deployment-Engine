## 🛡️ Policy Deployment Engine: `access_context_manager_authorized_orgs_desc`

This section provides a concise policy evaluation for the `access_context_manager_authorized_orgs_desc` resource in GCP.

Reference: [Terraform Registry – access_context_manager_authorized_orgs_desc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_authorized_orgs_desc)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | Required. Resource name for the access policy which owns this `AuthorizedOrgsDesc`. | true | None | None |
| `name` | Resource name for the `AuthorizedOrgsDesc`. Format: `accessPolicies/{access_policy}/authorizedOrgsDescs/{authorized_orgs_desc}`. The `authorized_orgs_desc` component must begin with a letter, followed by alphanumeric characters or `_`. After you create an `AuthorizedOrgsDesc`, you cannot change its `name`. | true | None | None |
| `orgs` | The list of organization ids in this AuthorizedOrgsDesc. Format: `organizations/<org_number>` Example: `organizations/123456` | false | None | None |
| `asset_type` | The type of entities that need to use the authorization relationship during evaluation, such as a device. Valid values are "ASSET_TYPE_DEVICE" and "ASSET_TYPE_CREDENTIAL_STRENGTH". Possible values are: `ASSET_TYPE_DEVICE`, `ASSET_TYPE_CREDENTIAL_STRENGTH`. | false | None | None |
| `authorization_direction` | The direction of the authorization relationship between this organization and the organizations listed in the "orgs" field. The valid values for this field include the following: AUTHORIZATION_DIRECTION_FROM: Allows this organization to evaluate traffic in the organizations listed in the `orgs` field. AUTHORIZATION_DIRECTION_TO: Allows the organizations listed in the `orgs` field to evaluate the traffic in this organization. For the authorization relationship to take effect, all of the organizations must authorize and specify the appropriate relationship direction. For example, if organization A authorized organization B and C to evaluate its traffic, by specifying "AUTHORIZATION_DIRECTION_TO" as the authorization direction, organizations B and C must specify "AUTHORIZATION_DIRECTION_FROM" as the authorization direction in their "AuthorizedOrgsDesc" resource. Possible values are: `AUTHORIZATION_DIRECTION_TO`, `AUTHORIZATION_DIRECTION_FROM`. | false | None | None |
| `authorization_type` | A granular control type for authorization levels. Valid value is "AUTHORIZATION_TYPE_TRUST". Possible values are: `AUTHORIZATION_TYPE_TRUST`. | false | None | None |
