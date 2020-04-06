module "tfplan-functions" {
    source = "common-functions/tfplan-functions.sentinel"
}

policy "require-access-keys-use-pgp-1" {
    enforcement_level = "hard-mandatory"
}
