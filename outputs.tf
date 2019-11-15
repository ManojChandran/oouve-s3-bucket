#----root/outputs.tf----

output "Bucket-Name" {
  value = "${module.backend.bucketname}"
}
