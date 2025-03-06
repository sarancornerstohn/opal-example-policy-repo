# By default, deny requests
default allow = false

# Allow action if the role has the required permission
allow {
    # Retrieve the permission for the role
    role_permissions := data.role_permissions[input.role]
    
    # Check if the action and type match a permission for the role
    permission_exists(role_permissions, input.action, input.type)
}

# Helper rule to check if a permission exists
permission_exists(role_permissions, action, type) {
    some permission
    permission = role_permissions[_]
    permission.action == action
    permission.type == type
}
