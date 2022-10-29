variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "object_key" {
  type        = string
  description = "The name of the object once it is in the bucket"
}

variable "source_file" {
  type        = string
  description = "Optional, conflicts with content and content_base64) Path to a file that will be read and uploaded as raw bytes for the object content."
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}

variable "tag_terraform" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}
