variable "bucket_name" {
    type = string
    description = "Bucket name for S3"
}

variable "project" {
    type = string
    description = "Client name for S3"
}

variable "s3_acl" {
    type = string
    description = "Acl for the S3"
}
variable "environment" {
    type = string
    description = "environment for the s3"
    default = "production"
}
