package terraform.gcp.security.discovery_engine.data_store.data_store_document_processing_config # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_store.vars

#document_processing_config

conditions := [
    [
    {
        "situation_description": "Is use_native_text set to true?",
        "remedies": ["Ensure that it is set to true"]
        },
      {
        "condition": "allow_cross_region is mis-configured",
        "attribute_path": ["document_processing_config", 0, "parsing_config_overrides", 0, "ocr_parsing_config", 0, "use_native_text"],
        "values": [false],
        "policy_type": "blacklist"
      }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details