/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "vpc" {
  source                           = "github.com/terraform-google-modules/cloud-foundation-fabric//modules/net-vpc?ref=v6.0.0"
  project_id                       = var.project_id
  name                             = var.network
  subnets                          = []
  private_service_networking_range = var.peering_range
}

module "apigee-x-core" {
  source              = "../../modules/apigee-x-core"
  project_id          = var.project_id
  apigee_environments = var.apigee_environments
  ax_region           = var.ax_region
  apigee_envgroups    = var.apigee_envgroups
  network             = module.vpc.network.id
  apigee_instances    = var.apigee_instances
}
