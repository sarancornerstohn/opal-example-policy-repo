# By default, deny requests
default allow = false

# Allow action if the role has the required permission
allow {
    # Retrieve the permission for the role
    some permission
    role_is_granted[permission]

    # Ensure the action and type match the permission
    input.action == permission.action
    input.type == permission.type
}

# role_is_granted is a set of permissions for the role identified in the request.
role_is_granted[permission] {
    # Get the role from input
    role := input.role

    # Find the permission associated with the role in the data
    permission := data.role_permissions[role][_]
}
