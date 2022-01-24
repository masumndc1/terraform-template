resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "8eba1ccc-bbeb-4769-b0a3-1f2b3b523b75"
  flavor_id       = "0143b0d1-4788-4d1f-aa04-4473e4a7c2a6"
  key_pair        = "khabirtest"
  security_groups = ["default"]

  metadata = {
    #    this = "that"
  }

  network {
      name = "test-network"
  }

}
