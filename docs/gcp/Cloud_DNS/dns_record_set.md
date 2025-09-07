## 🛡️ Policy Deployment Engine: `dns_record_set`

This section provides a concise policy evaluation for the `dns_record_set` resource in GCP.

Reference: [Terraform Registry – dns_record_set](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set)

---

## 1. Argument Reference

### `managed_zone`
- Description: reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rrdatas`
- Description: whose meaning depends on the DNS type. For TXT record, if the string data contains spaces, add surrounding `\"` if you don't want your string to get split on spaces. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add `\" \"` inside the Terraform configuration string (e.g. `"first255characters\" \"morecharacters"`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routing_policy`
- Description: Now you can specify either Weighted Round Robin(WRR) type or Geolocation(GEO) type. Structure is [documented below](#nested_routing_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used. <a name="nested_routing_policy"></a>The `routing_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wrr`
- Description: Structure is [documented below](#nested_wrr).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `geo`
- Description: Structure is [documented below](#nested_geo).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_geo_fencing`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_backup`
- Description: Structure is [documented below](#nested_primary_backup).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_check`
- Description: <a name="nested_wrr"></a>The `wrr` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rrdatas`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_checked_targets`
- Description: Structure is [documented below](#nested_health_checked_targets). <a name="nested_geo"></a>The `geo` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rrdatas`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_checked_targets`
- Description: Structure is [documented below](#nested_health_checked_targets). <a name="nested_primary_backup"></a>The `primary_backup` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary`
- Description: Structure is [documented below](#nested_health_checked_targets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_geo`
- Description: Structure is [document above](#nested_geo).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_geo_fencing_for_backups`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trickle_ratio`
- Description: <a name="nested_health_checked_targets"></a>The `health_checked_targets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internal_load_balancers`
- Description: Structure is [documented below](#nested_internal_load_balancers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_endpoints`
- Description: <a name="nested_internal_load_balancers"></a>The `internal_load_balancers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_url`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
