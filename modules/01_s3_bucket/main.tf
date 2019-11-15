#------------------------------01_s3_bucket/main.tf-------------------------------
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------


#-------------variable section----------------------
variable "project-name" {}

#-------------control section-----------------------
# create a random id for bucket name
resource "random_id" "bucket-id" {
    byte_length = 2
}

# create a bucket
resource "aws_s3_bucket" "backend-bucket" {
  bucket = "${var.project-name}-${random_id.bucket-id.dec}"
  acl = "private"
  force_destroy = "true"

  tags = {
    name = "backend-bucket"
  }

}

#-------------output section-------------------------

output "bucketname" {
  value = "${aws_s3_bucket.backend-bucket.bucket_domain_name}"
}
