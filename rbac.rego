# By default, deny requests
default allow = false

# Allow the action if the role has the required permission
allow {
    some permission
    role_is_granted[permission]

    input.action == permission.action
    input.type == permission.type
}

# role_is_granted is a set of permissions for the role identified in the request.
role_is_granted[permission] {
    some i, j

    # The role assigned in the input
    role := input.role

    # The permission assigned to this role
    permission := data.role_permissions[role][j]
}
