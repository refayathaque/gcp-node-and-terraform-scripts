resource "google_storage_bucket" "test" {
  name                        = random_uuid.generator.result
  location                    = "us-east4"
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "random_uuid" "generator" {}