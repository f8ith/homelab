vault {
  address = "https://openbao.jamietong.com"
}

auto_auth {
  method {
    type      = "approle"
    namespace = "admin"

    config = {
      role_id_file_path   = "/bao/role_id"
      secret_id_file_path = "/bao/secret_id"
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