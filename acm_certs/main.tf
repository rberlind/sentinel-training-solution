variable "domain" {
  description = "domain of Amazon Certificate Manager certificate"
}

data "aws_acm_certificate" "hashidemos" {
  domain = "${var.domain}"
}
