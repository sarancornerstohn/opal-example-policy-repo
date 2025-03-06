package app.rbac

default allow = false

allow {
    role_has_permission(input.role, input.action, input.type)
}

role_has_permission(role, action, type) {
    some permission
    permission := data.roles[role][_]
    permission.action == action
    permission.type == type
    # Add some debug statements to print out what data is being matched
    trace("permission", permission)
}
