variable "bucket_name" {
  type = string
  description = "bucket name"
  default = "td2-esrdgfhgerdgfh"
}

variable "tags" {
  type = object({
    Name = string
    Environment = string
  })
  default = {
    Name = "tp2"
    Environment = "dev"
  }
}

variable "mime_types" {
  description = "Mapping of file extensions to their respective MIME (Multipurpose Internet Mail Extensions) types. This helps in determining the nature and format of a document."
  type        = map(string)
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    ttf  = "font/ttf"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
  }
}

variable "sync_directories" {
  type = list(object({
    local_source_directory = string
    s3_target_directory    = string
  }))
  description = "List of directories to synchronize with Amazon S3."
  default     = [{
    local_source_directory = "../build"
    s3_target_directory    = ""
  }]
}