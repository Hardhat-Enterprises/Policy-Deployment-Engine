package terraform.gcp.security.cloud_domains.google_clouddomains_registration.domain_notices

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration does not acknowledge HSTS_PRELOADED notice.",
            "remedies": ["Add 'HSTS_PRELOADED' to the 'domain_notices' list."]
        },
        {
            "condition": "Check if HSTS_PRELOADED notice is acknowledged",
            # policy_lint reports index-path here, and the trailing index is
            # deliberate: this is a "the list must CONTAIN this value" check, and
            # none of the six policy types can express it over a whole list.
            # Dropping the index makes an empty domain_notices vacuously
            # compliant (whitelist over an array is a subset test, and the empty
            # set is a subset of everything), which is exactly the case the
            # non-compliant fixture is testing. Needs a new policy type in
            # _helpers, not a change here.
            "attribute_path": ["domain_notices", 0],
            "values": ["HSTS_PRELOADED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
