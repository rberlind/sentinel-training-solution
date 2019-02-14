variable "domain_1" {
  description = "domain of first Amazon Certificate Manager certificate"
}

variable "domain_2" {
  description = "domain of second Amazon Certificate Manager certificate"
}

data "aws_acm_certificate" "cert_1" {
  domain = "${var.domain_1}"
  types = ["AMAZON_ISSUED", "IMPORTED"]
}

data "aws_acm_certificate" "cert_2" {
  domain = "${var.domain_2}"
  types = ["AMAZON_ISSUED", "IMPORTED"]
}

resource "aws_acm_certificate" "new_cert" {
  domain_name = "roger.hashidemos.io"
  subject_alternative_names = ["roger1.hashidemos.io", "roger2.hashidemos.io", "roger3.hashidemos.io"]
  validation_method = "DNS"
  
  tags {
    owner = "roger"
    ttl = "24"
  }

}
