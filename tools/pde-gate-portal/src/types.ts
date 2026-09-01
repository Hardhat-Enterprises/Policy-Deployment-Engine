export type OrgRecord = {
    org_id: string;
    token: string;
    schema_version: string;
    org_name: string;
    registered_at: string;
    approved_regions: string[];
    approved_zones: string[];
    policy_pin: string;
    contact_email: string;
    policy_profile?: string;
    enabled_policies?: Record<string, string[]>;
};

export type RegisterRequest = {
    org_name: string;
    contact_email: string;
    approved_regions: string[];
    approved_zones?: string[];
    policy_profile?: string;
    enabled_policies?: Record<string, string[]>;
};

export type RegisterResponse = {
    org_id: string;
    token: string;
    message: string;
};
