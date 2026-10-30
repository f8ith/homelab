vault {
  address = "https://openbao.jamietong.com"
}

auto_auth {
  method {
    type      = "approle"

    config = {
      role_id_file_path   = "/bao/role_id"
      secret_id_file_path = "/bao/secret_id"
      remove_secret_id_file_after_reading = false
    }
  }
}

api_proxy {
  use_auto_auth_token = true
}

listener "tcp" {
  address = "0.0.0.0:8100"
  tls_disable = true
}