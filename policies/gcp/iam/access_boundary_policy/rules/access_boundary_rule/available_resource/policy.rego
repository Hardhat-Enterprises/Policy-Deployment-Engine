package terraform.gcp.security.iam.access_boundary_policy.rules.access_boundary_rule.available_resource # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)
apigee_rsc = [
    "ApiProduct", "ApiProductAttribute", "Cache", "Developer", "DeveloperApp",
    "DeveloperAppAttribute", "DeveloperAttribute", "Export", "FlowHook", "KeyStore",
    "KeyStoreAlias", "KeyValueEntry", "KeyValueMap", "Proxy", "ProxyRevision", "Query",
    "RatePlan", "Reference", "SharedFlow", "SharedFlowRevision", "TargetServer", "TraceSession"
]

apihub_rsc = [
    "Api", "Deployment", "Version", "Spec", "ApiOperation", "Definition"
]

backupdr_rsc = [
    "BackupVaults"
]

bigquery_rsc = [
    "Dataset", "Model", "Routine", "Table"
]

bigqueryreservation_rsc = [
    "Assignment", "BiReservation", "CapacityCommitment", "Location", "Reservation"
]

bigtableadmin_rsc = [
    "AppProfile", "Backup", "Cluster", "Instance", "Table"
]

binaryauthorization_rsc = [
    "Attestor", "ContinuousValidationConfig", "Policy"
]

cloud_rsc = [
    "Location1"
]

cloudkms_rsc = [
    "CryptoKey", "CryptoKeyVersion", "KeyRing"
]

cloudresourcemanager_rsc = [
    "Project2"
]

compute_rsc = [
    "BackendService", "Disk", "Firewall", "ForwardingRule", "GlobalForwardingRule",
    "Image", "Instance", "InstanceTemplate", "Snapshot", "TargetHttpProxy",
    "TargetHttpsProxy", "TargetSslProxy", "TargetTcpProxy"
]

connectors_rsc = [
    "Connection", "ConnectionSchemaMetadata", "EndpointAttachment", "EventSubscription", "ManagedZone"
]

container_rsc = [
    "Clusters"
]

dataform_rsc = [
    "CompilationResult", "Location", "ReleaseConfig", "Repository",
    "WorkflowConfig", "WorkflowInvocation", "Workspace"
]

firestore_rsc = [
    "Database"
]

iap_rsc = [
    "Tunnel", "TunnelInstance", "TunnelZone", "Web", "WebService", "WebServiceVersion", "WebType"
]

integrations_rsc = [
    "AuthConfig", "Execution", "Integration", "IntegrationVersion", "Location", "Suspension"
]

logging_rsc = [
    "LogBucket", "LogView"
]

managedkafka_rsc = [
    "Cluster", "ConsumerGroup", "Operation", "Topic"
]

pubsublite_rsc = [
    "Location", "Subscription", "Topic"
]

secretmanager_rsc = [
    "Secret", "SecretVersion"
]

spanner_rsc = [
    "Backup", "Database", "Instance"
]

sqladmin_rsc = [
    "BackupRun", "Instance"
]

storage_rsc = [
    "Bucket", "ManagedFolder", "Object"
]


# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "not in approved list of conditions", # name/description of the scenario
            "remedies": ["rules.access_boundary_rule.available_permissions should be from approved list"] # fix messages
        },
    {
        "condition": "c1: only compliant apigee resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["apigee[.]googleapis[.]com/*", [apigee_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c2: only compliant apihub resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["apihub[.]googleapis[.]com/*", [apihub_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c3: only compliant backupdr resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["backupdr[.]googleapis[.]com/*", [backupdr_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c4: only compliant bigquery resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["bigquery[.]googleapis[.]com/*", [bigquery_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c5: only compliant bigqueryreservation resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["bigqueryreservation[.]googleapis[.]com/*", [bigqueryreservation_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c6: only compliant bigtableadmin resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["bigtableadmin[.]googleapis[.]com/*", [bigtableadmin_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c7: only compliant binaryauthorization resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["binaryauthorization[.]googleapis[.]com/*", [binaryauthorization_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c8: only compliant cloud resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["cloud[.]googleapis[.]com/*", [cloud_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c9: only compliant cloudkms resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["cloudkms[.]googleapis[.]com/*", [cloudkms_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c10: only compliant cloudresourcemanager resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["cloudresourcemanager[.]googleapis[.]com/*", [cloudresourcemanager_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c11: only compliant compute resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["compute[.]googleapis[.]com/*", [compute_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c12: only compliant connectors resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["connectors[.]googleapis[.]com/*", [connectors_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c13: only compliant container resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["container[.]googleapis[.]com/*", [container_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c14: only compliant dataform resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["dataform[.]googleapis[.]com/*", [dataform_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c15: only compliant firestore resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["firestore[.]googleapis[.]com/*", [firestore_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c16: only compliant iap resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["iap[.]googleapis[.]com/*", [iap_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c17: only compliant integrations resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["integrations[.]googleapis[.]com/*", [integrations_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c18: only compliant logging resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["logging[.]googleapis[.]com/*", [logging_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c19: only compliant managedkafka resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["managedkafka[.]googleapis[.]com/*", [managedkafka_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c20: only compliant pubsublite resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["pubsublite[.]googleapis[.]com/*", [pubsublite_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c21: only compliant secretmanager resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["secretmanager[.]googleapis[.]com/*", [secretmanager_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c22: only compliant spanner resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["spanner[.]googleapis[.]com/*", [spanner_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c23: only compliant sqladmin resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["sqladmin[.]googleapis[.]com/*", [sqladmin_rsc]],
        "policy_type": "pattern whitelist"
    },
    {
        "condition": "c24: only compliant storage resources",
        "attribute_path": ["rules", 0, "access_boundary_rule", 0, "available_resource"],
        "values": ["storage[.]googleapis[.]com/*", [storage_rsc]],
        "policy_type": "pattern whitelist"
    }
    ],
        [
        { 
            "situation_description" : "all resources", # name/description of the scenario
            "remedies": ["rules.access_boundary_rule.available_resource should not be set to all"] # fix messages
        },
        {
            "condition" : "c1: rules.access_boundary_rule.available_resource set to *", # condition name
            "attribute_path" : ["rules", 0, "access_boundary_rule", 0, "available_resource"], # nested path
            "values" : ["*"], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
