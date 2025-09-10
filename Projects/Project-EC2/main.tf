


resource "aws_instance" "projectec2" {
    ami           = "ami-02d26659fd82cf299"  # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type in ap-south-1
    instance_type = "t3.micro"
    key_name      = aws_key_pair.generated_key.id
    vpc_security_group_ids = [aws_security_group.projectec2_sg.id]
    tags={
        Name = "MyEC2Instance"
    }
}
resource "aws_key_pair" "generated_key" {
  public_key = file("~/.ssh/id_rsa.pub")      # Path to your existing public key
}



resource "aws_security_group" "projectec2_sg" {
    name        = "projectec2_sg"
    description = "Security group for Project EC2 instance"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}