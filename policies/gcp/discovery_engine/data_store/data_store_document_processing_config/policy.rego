package terraform.gcp.security.discovery_engine.data_store.data_store_document_processing_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_store.vars

#document_processing_config

#check

conditions := [
    [
    {
        "situation_description": "Is use_native_text set to true?",
        "remedies": ["Ensure that it is set to true"]
        },
      {
        "condition": "document_processing_config is mis-configured",
        "attribute_path": ["document_processing_config", 0, "parsing_config_overrides", 0, "ocr_parsing_config", 0, "use_native_text"],
        "values": [false],
        "policy_type": "blacklist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details