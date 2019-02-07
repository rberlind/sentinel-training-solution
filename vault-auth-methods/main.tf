variable "type" {
  description = "type of Vault auth method"
}

variable "path" {
  description = "path to Vault auth method"
}

resource "vault_auth_backend" "test" {
  type = "${var.type}"
  path = "${var.path}"
}
