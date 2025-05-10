Related URL Compliance Policy for Google Container Analysis Notes
Overview

In this policy, I am ensuring that the URLs linked to Google Container Analysis Notes are valid and safe. The goal is to allow only trusted URLs, blocking any potentially harmful or untrusted links. This helps in keeping the project secure by maintaining control over which URLs are linked to resources.
Why Is This Important?

It's important to ensure that only trusted and verified URLs are associated with our container analysis notes for several reasons:

    Security: Only allow URLs that we trust to prevent malicious content or phishing links from being associated with our resources.

    Integrity: Ensure that resources are linked to the correct documentation or relevant project pages.

    Consistency: Maintain a standard set of valid URLs to keep things organized and avoid random, disallowed links.

What Does This Policy Do?
Compliant Resources:

A resource is considered compliant if the URL provided in the related_url field is one of the trusted and allowed URLs.

    Example of a Compliant URL:

        URL: Policy Deployment Engine

        Label: "Policy Deployment Engine"

Non-Compliant Resources:

If the related_url field contains a URL that is not in the trusted list, the resource is considered non-compliant.

    Example of a Non-Compliant URL:

        URL: Invalid URL

        Label: "Invalid URL"

How It Works
The Allowed URLs:

There is a list of allowed URLs that are trusted. If the URL in the related_url matches one of these, the resource passes the compliance check. If it doesn't match, the resource fails the check.
OPA Evaluation:

We use Open Policy Agent (OPA) to evaluate whether the URLs are compliant. This tool checks if the related_url field matches one of the trusted URLs.
What Happens During the Check?

    Compliant: If the URL matches the allowed list, the resource is compliant.

    Non-Compliant: If the URL doesn’t match, the resource is flagged as non-compliant.

Steps to Run the Check
Files Involved:

    c.tf: This file defines a compliant resource, meaning the related_url matches a valid URL.

    nc.tf: This file defines a non-compliant resource, meaning the related_url has an invalid URL.

    plan.json: This is the file where Terraform defines the resources it plans to create, including the related_url values.

    policy.rego: This is the file where the rules for compliance are written. It defines how the policy checks the URLs.

    How to Check the URL Compliance:

To run the check, I use this command:

opa eval --data .\policies\gcp --input .\inputs\registries\analysis_note\related_url\plan.json --format pretty "data.terraform.gcp.security.registries.google_container_analysis_note.related_url.message"

This command checks if the related_url field in the plan is compliant. If the URLs match the allowed ones, it will say the resource is compliant. If they don’t, it will say the resource is non-compliant.
Example Output:

If everything is good (compliant), I will see something like this:

"Total detected: 1 ",
[
  "Situation 1: Related URL does not match the allowed URL(s).",
  "Non-Compliant Resources: example-note-nc",
  "Potential Remedies: Ensure related URL matches the allowed URL(s)."
]

How to Fix Non-Compliant Resources

If a resource is flagged as non-compliant, here’s how to fix it:

    Find the resource with the non-compliant related_url.

    Update the related_url field to one of the allowed URLs.

Example Fix:

For a non-compliant resource, I change the related_url from:

related_url = [
    {
        label = "Invalid URL"
        url   = "https://disallowed-url.com"
    }
]

To:

related_url = [
    {
        label = "Policy Deployment Engine"
        url   = "https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/tree/gcp/service/cloud_vmware_engine/policies/gcp"
    }
]

After updating the related_url, I can re-run the policy check to make sure it is now compliant.
Conclusion

This policy helps ensure that all URLs linked to the Google Container Analysis Notes are valid and from a trusted source. By keeping control over which URLs are used, I can ensure that only safe and relevant links are associated with resources. This helps improve security and consistency in the project.