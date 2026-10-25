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

  sink {
    type = "file"

    config = {
      path = "/bao-shared/.openbao-token"
    }
  }
}