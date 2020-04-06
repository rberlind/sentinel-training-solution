module "tfplan-functions" {
    source = "common-functions/tfplan-functions.sentinel"
}

policy "require-even-number" {
    enforcement_level = "hard-mandatory"
}

policy "require-access-keys-use-pgp-1" {
    enforcement_level = "hard-mandatory"
}

policy "require-access-keys-use-pgp-2" {
    enforcement_level = "hard-mandatory"
}

policy "restrict-gcp-instance-image-1" {
    enforcement_level = "hard-mandatory"
}

policy "restrict-gcp-instance-image-2" {
    enforcement_level = "hard-mandatory"
}

policy "require-modules-from-pmr-1" {
    enforcement_level = "hard-mandatory"
}

policy "prevent-auto-apply-in-production" {
    enforcement_level = "hard-mandatory"
}
