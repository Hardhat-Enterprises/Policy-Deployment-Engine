## 🛡️ Policy Deployment Engine: `developer_connect_git_repository_link`

This section provides a concise policy evaluation for the `developer_connect_git_repository_link` resource in GCP.

Reference: [Terraform Registry – developer_connect_git_repository_link](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_git_repository_link)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `clone_uri` | Required. Git Clone URI. | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. See documentation for resource type `developerconnect.googleapis.com/GitRepositoryLink`. | true | None | None |
| `parent_connection` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. See documentation for resource type `developerconnect.googleapis.com/GitRepositoryLink`. | true | None | None |
| `git_repository_link_id` | Required. The ID to use for the repository, which will become the final component of the repository's resource name. This ID should be unique in the connection. Allows alphanumeric characters and any of -._~%!$&'()*+,;=@. | true | None | None |
| `labels` | Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `etag` | Optional. This checksum is computed by the server based on the value of other fields, and may be sent on update and delete requests to ensure the client has an up-to-date value before proceeding. | false | None | None |
| `annotations` | Optional. Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
