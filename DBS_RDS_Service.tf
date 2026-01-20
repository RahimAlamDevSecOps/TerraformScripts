provider "aws" {
  region = "ca-central-1"
}

#create mysql rds db using TF
resource "aws_db_instance" "myrds" {
  engine = "mysql"
  #engine_version = "8.0.32"
  allocated_storage = 20
  instance_class = "db.t3.micro"
  storage_type = "gp2"
  identifier = "mydb"
  username = "admin"
  password = "adminADMINadmin"
  publicly_accessible = false
  skip_final_snapshot = true
  tags = {
    Name = "MySQLdb"
  }
}