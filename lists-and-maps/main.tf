# This is used to illustrate referencing lists and maps in Sentinel

# An Amazon Certificate Manager (ACM) certificate resource
resource "aws_acm_certificate" "new_cert" {
  domain_name = "roger.hashidemos.io"
  subject_alternative_names = ["roger1.hashidemos.io", "roger2.hashidemos.io", "roger3.hashidemos.io"]
  validation_method = "DNS"
  
  tags {
    owner = "roger"
    ttl = "24"
  }

}
