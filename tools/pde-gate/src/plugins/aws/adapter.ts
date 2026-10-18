import type { Canonicalizer, PlatformAdapter } from "../types.js";

function stubAdapter(id: "aws" | "azure"): PlatformAdapter {
  return {
    id,
    detect: () => false,
    listResourceTypes: () => [],
    policiesSubdir: () => id,
    mergeOrgConfig: () => {
      throw new Error(`${id} platform is not enabled yet (GCP-only MVP)`);
    },
  };
}

function stubCanonicalizer(id: "aws" | "azure"): Canonicalizer {
  return {
    id,
    canonicalize() {
      throw new Error(`${id} canonicalizer not implemented (GCP-only MVP)`);
    },
  };
}

export const awsAdapter = stubAdapter("aws");
export const azureAdapter = stubAdapter("azure");
export const awsCanonicalizer = stubCanonicalizer("aws");
export const azureCanonicalizer = stubCanonicalizer("azure");
