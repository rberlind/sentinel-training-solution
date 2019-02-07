variable "type" {
  description = "type of Vault auth method"
}

resource "vault_auth_backend" "test" {
  type = "${var.type}"
}
