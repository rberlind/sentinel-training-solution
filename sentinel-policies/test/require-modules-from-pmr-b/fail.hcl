param "organization" {
  value = "Cloud-Operations"
}

module "module-functions" {
  source = "../../common-functions/module-functions/module-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
