import { gcpAdapter } from './gcp/adapter.js';
import { gcpCanonicalizer } from './gcp/canonicalizer.js';
import { awsAdapter, awsCanonicalizer, azureAdapter, azureCanonicalizer } from './aws/adapter.js';
import type { Canonicalizer, PlatformAdapter, PlatformId } from './types.js';

const adapters: Record<PlatformId, PlatformAdapter> = {
    gcp: gcpAdapter,
    aws: awsAdapter,
    azure: azureAdapter,
};

const canonicalizers: Record<PlatformId, Canonicalizer> = {
    gcp: gcpCanonicalizer,
    aws: awsCanonicalizer,
    azure: azureCanonicalizer,
};

export function getAdapter(id: PlatformId): PlatformAdapter {
    return adapters[id];
}

export function getCanonicalizer(id: PlatformId): Canonicalizer {
    return canonicalizers[id];
}

export function resolvePlatform(plan: Record<string, unknown>, explicit?: string): PlatformId {
    if (explicit === 'gcp' || explicit === 'aws' || explicit === 'azure') {
        return explicit;
    }
    if (gcpAdapter.detect(plan)) return 'gcp';
    if (awsAdapter.detect(plan)) return 'aws';
    if (azureAdapter.detect(plan)) return 'azure';
    return 'gcp';
}
