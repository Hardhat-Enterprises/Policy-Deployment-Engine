export type PolicyPackage = {
    package_id: string;
    name: string;
    description?: string;
    platforms: string[];
    policy_groups: Record<string, string[]>;
    variables?: {
        approved_regions?: string[];
        approved_zones?: string[];
        [key: string]: unknown;
    };
    updated_at: string;
};

export type OrgPublic = {
    org_id: string;
    org_name: string;
    contact_email: string;
    registered_at: string;
};

export type RegisterRequest = {
    org_name: string;
    contact_email: string;
};

export type RegisterResponse = {
    org_id: string;
    api_key: string;
    message: string;
};

export type CreatePackageRequest = {
    name: string;
    description?: string;
    platforms?: string[];
    policy_groups?: Record<string, string[]>;
    variables?: PolicyPackage['variables'];
};
