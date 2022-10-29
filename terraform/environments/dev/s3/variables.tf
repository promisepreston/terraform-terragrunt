variable "bucket" {
  type        = string
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  default     = "localhost-promise"
}

variable "acl" {
  type        = string
  description = "The canned ACL to apply. Conflicts with grant"
  default     = "private"
}

variable "versioning" {
  type        = map(bool)
  description = "Map containing versioning configuration."
  default = {
    true  = true
    false = false
  }
}

variable "object_key" {
  type        = list(string)
  description = "The name of the object once it is in the bucket"
  default = [
      "log-files/",
      "error-files"
    ]
}
