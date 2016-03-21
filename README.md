# JBoss ASG example

Based on https://github.com/hashicorp/terraform/tree/master/examples/aws-asg

This example shows how to launch Terraform instances using Auto Scaling Groups.

This creates a security group, launch configuration, auto scaling group and an ELB. The user data for launch configuration installs nginx, java and JBoss and it listens on port ```80``` (the JBoss instances listen on port ```8080```, but are not accessible on their public interfaces).

The example uses Ubuntu AMIs.

Make sure you change the list of availability zones that is applicable to your account and region. See http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#using-regions-availability-zones-describe to list your AZ's.

To run, configure your AWS provider as described in https://www.terraform.io/docs/providers/aws/index.html

## Running the example

For planning phase:  
```terraform plan -var 'key_name={your_key_name}}'```

For apply phase:  
```terraform apply -var 'key_name={your_key_name}}'```

Once the stack is created, wait for few minutes and test the stack by launching a browser with ELB url.

To remove the stack:  
 ```terraform destroy -var 'key_name={your_key_name}}'```
