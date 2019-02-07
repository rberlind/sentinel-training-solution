variable "type" {
  description = "type of Vault auth method"
}

resource "vault auth_backend" "test" {
  type = "${var.type}"
}
