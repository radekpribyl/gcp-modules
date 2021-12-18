locals {
  omni = {
    opco     = "omni"
    owner    = "omni"
    projects = {
      "dev" : "df-intcoeomni-dev-fec1",
      "tst" : "df-intcoeomni-tst-639c",
      "prd" : "df-intcoeomni-prd-2d35"
    }
  }
  data = {
    opco     = "data"
    owner    = "data"
    projects = {
      "dev" : "df-intcoedata-dev-a6d1",
      "tst" : "df-intcoedata-tst-8da6",
      "prd" : "df-intcoedata-prd-1ed2"
    }
  }
}