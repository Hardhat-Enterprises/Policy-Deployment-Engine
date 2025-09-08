## 🛡️ Policy Deployment Engine: `datastream_private_connection`

This section provides a concise policy evaluation for the `datastream_private_connection` resource in GCP.

Reference: [Terraform Registry – datastream_private_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/datastream_private_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Display name. | true | None | None |
| `private_connection_id` | The private connectivity identifier. | true | None | None |
| `location` | The name of the location this private connection is located in. | true | None | None |
| `labels` | Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `create_without_validation` | If set to true, will skip validations. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### vpc_peering_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vpc` | Fully qualified name of the VPC that Datastream will peer to. Format: projects/{project}/global/{networks}/{name} | true | None | None |
| `subnet` | A free subnet for peering. (CIDR of /29) | true | None | None |

### psc_interface_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_attachment` | Fully qualified name of the network attachment that Datastream will connect to. Format: projects/{project}/regions/{region}/networkAttachments/{name} To get Datastream project for the accepted list: `gcloud datastream private-connections create [PC ID] --location=[LOCATION] --network-attachment=[NA URI] --validate-only --display-name=[ANY STRING]` Add Datastream project to the attachment accepted list: `gcloud compute network-attachments update [NA URI] --region=[NA region] --producer-accept-list=[TP from prev command]` | true | None | None |
