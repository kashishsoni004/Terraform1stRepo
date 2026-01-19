resource "aws_instance" "name" {
    ami          = "ami-07ff62358b87c711"
    instance_type = "t2.micro"
    tags = {
        Name = "lifecycle"
    }
    # lifecycle {
    #     prevent_destroy = true          # to prevent accidental deletion of the resource
    # }
    # lifecycle {
    #    ignore_changes = [ tags ]        # to ignore those changes what you do manually outside terraform
    # }
    lifecycle {
        create_before_destroy = true      #if i am give wrong ami id what will happen first it will destroy instance then then create new instance
                                          # if you change this behevier you should use create_before_destroy
                                          # it will create new instance first then destroy old instance
  
}
}

