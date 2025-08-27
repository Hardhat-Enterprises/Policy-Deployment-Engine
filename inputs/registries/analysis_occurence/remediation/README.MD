Policy Deployment Engine: Google Cloud Platform (GCP) - Container Analysis Occurrence
Overview

This repository implements policies for managing Google Cloud Platform (GCP) resources, with a specific focus on Container Analysis Occurrence. The goal is to ensure that all occurrences comply with security and compliance standards, particularly in regards to attributes like serialized_payload, signatures, and public_key_id.

The policies are built using Open Policy Agent (OPA). They are designed to evaluate compliance based on specific conditions and provide remediation suggestions for any issues found.
Purpose

The main focus of this repository is to define remediation strategies for non-compliant resources. When a resource is found to be non-compliant, the policy provides recommended fixes for each situation. This enables users to easily correct issues with their resources and maintain compliance with organizational or security requirements.
Remediation Focus

When running the policy checks, you will receive a summary of any non-compliant resources. For each non-compliant resource, the remediation field will provide actionable steps to fix the issues. Here's a summary of how the remediation works:
Key Areas of Remediation:

    Serialized Payload

        Issue: The serialized_payload field is either missing or invalid.

        Remedy: Ensure the serialized_payload is provided and properly base64-encoded.

    Signature

        Issue: The signature field is missing or invalid.

        Remedy: Ensure the signature is provided and correctly generated.

    Public Key ID

        Issue: The public_key_id field is missing or invalid.

        Remedy: Ensure the public key ID is provided and correctly formatted (using a valid public key URI, like OpenPGP or other RFC compliant formats).

Example of Non-Compliant Resource and Remediation:
Non-Compliant Resource Example:

{
  "attestation": [
    {
      "serialized_payload": "",
      "signatures": [
        {
          "public_key_id": "",
          "signature": ""
        }
      ]
    }
  ]
}

Remediation Suggestions:

    Serialized Payload: Provide a valid base64-encoded string for the serialized_payload field.

    Signature: Ensure a valid signature is provided for the resource.

    Public Key ID: Attach a valid public_key_id, properly formatted.

Compliance Evaluation Command

You can evaluate the compliance of your resources using the following OPA evaluation command:

opa eval --data .\policies\gcp --input .\inputs\registries\analysis_occurence\remediation\plan.json --format pretty "data.terraform.gcp.security.registries.google_container_analysis_occurrence.remediation.message"

This command will generate a summary message that provides details about the non-compliant resources and suggests remediation steps to bring them into compliance.
Example Output:

[
  "Total Container Analysis Occurrence detected: 1 ",
  [
    "Situation 1: Serialized payload is missing or invalid.",
    "Non-Compliant Resources: google_container_analysis_occurrence.nc",
    "Potential Remedies: Ensure the serialized_payload is provided and correctly encoded."
  ],
  [
    "Situation 2: Signature is missing or invalid.",
    "Non-Compliant Resources: google_container_analysis_occurrence.nc",
    "Potential Remedies: Ensure the signature is provided and correctly generated."
  ],
  [
    "Situation 3: Public key ID is missing or invalid.",
    "Non-Compliant Resources: google_container_analysis_occurrence.nc",
    "Potential Remedies: Ensure the public_key_id is provided and correctly formatted."
  ]
]

In this output, you can see that the non-compliant resources are listed along with the specific remediation suggestions for each situation.
Remediation Process

When a resource is flagged as non-compliant, the following steps are recommended for remediation:

    Serialized Payload: Provide a valid base64-encoded string in the serialized_payload field.

    Signature: Ensure the signature field contains a valid signature, properly generated and corresponding to the public_key_id.

    Public Key ID: Attach a valid public_key_id using the correct format, such as OpenPGP or a similar valid URI.

By applying these remediation actions, you can ensure that all your Google Cloud Container Analysis Occurrence resources comply with the necessary security policies.