# aws-terraform-wordpress-app
This is WordPress application build on AWS using terraform (terraform as a code)


By using Cloud Automation, IT teams can automate the creation, modification, or deletion of cloud resources.There is an AWS cloud formation platform that can be used only to provision AWS resources.
The Terraform software tool is an open-source infrastructure as a code tool created by HashiCorp.The HashiCorp Configuration Language (HCL) is a declarative configuration language for defining and provisioning data center infrastructure.The HashiCorp Configuration Language (HCL) is a declarative configuration language for defining and provisioning data center infrastructure.
I will use Terraform to create AWS resources and automate WordPress installation using EC2 Userdata in this tutorial.
We need some prerequisites for this tutorial. If you don’t have them inplace in your system please install first.

**Prerequisites**
1. Download Terraform
2. Install AWS CLI

3. Grab the access key and secret key and store them in a file

Make sure you store the access key and secret key in ~yourhomedir/.aws/credentials file in the following format:

[default]
aws_access_key_id=XXXXXXXXXXXXXXXXXXXXX
aws_secret_access_key=XXXXXXXXXXXXXXXXXXXXXXXXX

Another way by  executing aws configure



**AWS Resources using here**
I am going to create an EC2 instance where WordPress will be installed and an RDS instance where MySQL database for WordPress will be provisioned.

We are going to use Terraform to automate cloud infrastructure (i.e create instances and security groups) and EC2 USERDATA to install an apache server and WordPress.

EC2 USERDATA is a bunch of scripts that can be used to send and execute processes after EC2 is provisioned. It will be run only once. I am using a bash script to execute the Linux command .

Userdata script is stored in TPL ( template file ) so that Terraform can render UserData script to edit the RDS endpoint, which can be known only after RDS creation is finalized.

We are going to create VPC under which we are going to create 3 subnets in three different Availability zone.

EC2 will be provisioned to public subnet and RDS will be installed to private subnet

**Terraform script workflow**
Terraform will use AWS CLI to interact with AWS resources. After confirming correct credentials, terraform start creating resources according to the written TF script. Terraform creates resources in a parallel manner but if one resource depends upon another resource, Terraform makes sure that the initial resource is created first. For eg security group is created before creating the instance.

In this case, since the WordPress database depends upon the RDS endpoint, I use depends_on on EC2 resource script to avoid creating EC2 instances before RDS.

**Process to create the Infrastructure (Three Tier Application)
**
The project consists of the following files:
1.	main_script.tf             
2.	user_data.tpl              
3.	userdata_ubuntu.tpl 
4.	variables.tf                   
5.	versions.tf
6.	aws_ami.tf

**Initialize Terraform to install the plugin.** 
terraform init
**Generate Keypair using    **   

ssh-keygen -f mykey-pair  

**To verify what resources will create run**
terraform plan
**To apply run **
terraform apply 
****The elastic IP address will be displayed after all resources have been created.********
After successful provisioning of AWS Resources, using remote-exec and private key, EC2 instance will be connected via SSH. Tail command will used to check progress of WordPress Installation. Once Installation is done, you will be provided with Public Ip address of Webserver.
