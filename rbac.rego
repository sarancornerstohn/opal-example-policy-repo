package app.rbac

default allow = false

allow {
    input.role == "customer"
    input.action == "read"
    input.type == "dog"
}
