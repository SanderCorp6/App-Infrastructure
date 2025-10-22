module "vm-linux-dev" {
    source = "../../modules/vm"
    
    aws_access_key = var.AWS_ACCESS_KEY
    aws_secret_key =  var.AWS_SECRET_KEY
    aws_region = var.AWS_REGION
    
    api_service = var.API_SERVICE
    api_email = var.API_EMAIL
    api_password = var.API_PASSWORD
    api_image = var.API_IMAGE
    api_jwt_secret = var.API_JWT_SECRET
    api_jwt_expiration = var.API_JWT_EXPIRATION
    api_port = var.API_PORT
    db_user = var.DB_USER
    db_name = var.DB_NAME
    db_pass = var.DB_PASS
    db_port = var.DB_PORT
    api_url = var.API_URL
    app_image = var.APP_IMAGE

    aws_env = var.AWS_ENV
    aws_server_name = var.AWS_SERVER_NAME
    aws_key_pair_name = var.AWS_KEY_PAIR_NAME
    aws_sg_name = var.AWS_SG_NAME

    main_domain = var.MAIN_DOMAIN
}