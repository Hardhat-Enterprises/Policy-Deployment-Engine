package terraforsm.gcp.security.cloud_buildv2.connection.oauth_token_secret_version

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

attribute_path := ["github_config", "authorizer_credential", "oauth_token_secret_version"]
compliant_values := ["starts-with:projects/"]



  summary := helpers.get_summary(
    vars.resource_type,
    attribute_path,
    compliant_values,
    vars.friendly_resource_name
  )
