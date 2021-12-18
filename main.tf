provider "google" {

}

module "shared_config" {
  source      = "./modules/shared"
  environment = "dev"
  application = "cit-messaging"
}