package terraform.gcp.security.firestore_backup_schedule.weekly_recurrence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_backup_schedule.vars

conditions := [
    [
        {
            "situation_description": "Firestore backup schedules must use weekly_recurrence to guarantee weekly backups.",
            "remedies": [
                "Set `weekly_recurrence = {}` in the google_firestore_backup_schedule resource block."
            ]
        },
        {
            "condition": "Checks if weekly_recurrence block is present",
            "attribute_path": ["weekly_recurrence"],
            "values": [{}], # 只接受 weekly_recurrence 块
            "policy_type": "whitelist"
#            "policy_type": "existence"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

#message := helpers.get_multi_summary(conditions, vars.variables).message
#details := helpers.get_multi_summary(conditions, vars.variables).details

# --- 以下为覆盖 / 增强逻辑，保证 message 只包含不合规的资源名，且永远非空 ---

# resource_type 从 vars 中获取（helpers 也会使用它）
resource_type := vars.variables.resource_type

# 收集 root_module 下的目标资源（与 auto_test.py 的行为一致）
resources := [ r |
    r := input.planned_values.root_module.resources[_]
    r.type == resource_type
]

# 找出没有定义 weekly_recurrence 的资源名集合
missing_weekly := { r.name |
    r := resources[_]
    not r.values.weekly_recurrence
}

# 为每个不合规资源构造友好失败信息（这些字符串中会包含资源名，供 auto_test.py 匹配）
failure_messages := [
    sprintf("Resource '%s' does not define `weekly_recurrence`", [name])
    | name := missing_weekly[_]
]

# 当没有不合规时，返回一个默认成功信息（避免 CI 将空 [] 视为错误）
success_message := ["All resources are compliant"]

# 最终导出的 message：优先失败信息；若为空则返回 success_message
message := failure_messages
message := success_message { count(failure_messages) == 0 }

# --- details 部分：优先使用 helpers 提供的 details（如果可用且包含条目）
helpers_details := summary.details

# 试图从 helpers_details 提取仅针对不合规资源的部分（如果 helpers_details 的结构是以资源名为键）
filtered_helpers_details := { name: helpers_details[name] |
    name := missing_weekly[_]
    helpers_details[name]
}

# 如果 helpers 没有提供可用的 details，就自己构建一个简单的 details 映射： name -> values
fallback_details := { name: r.values |
    r := resources[_]
    name := r.name
    not r.values.weekly_recurrence
}

# 最终 details：优先 filtered_helpers_details，否则 fallback_details
details := filtered_helpers_details
details := fallback_details { count(filtered_helpers_details) == 0 }