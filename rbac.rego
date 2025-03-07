package app.rbac

default allow = false

allow {
    role_permissions := data.roles[input.role]
    permission_exists(role_permissions, input.action)
}

permission_exists(role_permissions, action) {
    some permission
    permission = role_permissions[_]
    permission == action
}