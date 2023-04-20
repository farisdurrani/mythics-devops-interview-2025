# devops-2023 interview-challenge-terraform
Interview Challenge to provision resources using Terraform

# Objective

1. Solve the programming challenge
1. Create the resources on OCI as using Terraform
1. Configure and deploy the programming challenge on the created instance using Ansible
1. Create Ansible roles and playbooks to perform tasks

# Programming Challenge

Write a program in python to accept an interactive input keyword string and by using that read string , search through the data loaded from a json file : problem.json and print out the url name if a 
input string matches the name and/or description.


# Terraform

1. Refer to the file [Steps to Access Oracle Cloud.md](./Steps%20to%20Access%20Oracle%20Cloud.md) to ensure you can login to the Oracle Cloud
1. Create the following resources, which are shown in the pdf file [demo-stack-diagram.pdf](./demo-stack-diagram.pdf)
    - VCN `IC_VCN` 
    - Subnets `IC_pub_snet-A` and `IC_pvt_snet-B`
    - Gateways `IC_IG-A` and `IC_SG-A`
    - Compute instances `ic_pub_vm-A`, `ic_pvt_vm-B`, and `ic_pvt_vm-C`
2. Make sure to use the following variables in your terraform code:
    - Compartment ID : `ocid1.compartment.oc1..aaaaaaaau2d5tlzxsvkpz3iuzhuo4uemcn7kzmkv6fhjqbpxdzpg5ijz4tqq`
    - Image ID : `ocid1.image.oc1.iad.aaaaaaaab3w3vzjenuyy3idksenczspj77wz74o7unpxid6xr7zmsyi7u47q`
    - Shape : `VM.Standard.E4.Flex`
    - Availability Domain : `KGRc:US-ASHBURN-AD-1`
3. Configure the route tables, security lists, and network security groups:
    - Route table `ic_pub_rt-A` should include a route rule allowing use of the Internet gateway
    - Route table `ic_pvt_rt-B` should include a route rule allowing use of the Service gateway
    - Security list `ic_pub_sl-A` should allow:
        - outgoing ssh traffic to subnet `IC_pvt_snet-B`
        - outgoing icmp traffic to compute instance `ic_pvt_vm-B`
        - incoming ssh traffic from the internet
    - Security list `ic_pvt_sl-B` should allow:
        - outgoing traffic to `all-iad-services-in-oracle-services-network`
        - incoming ssh traffic from subnet `IC_pub_snet-A`
    - Network security group `ic_pvt_nsg-B` should allow ICMP traffic from `IC_pub_snet-A` *only* to the compute instance `ic_pvt_vm-B`
       
4. Modify the public compute instance's metadata to add your ssh public key and also add the public key below for grading purposes:
    > ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsE7KDT+mrJC93VmUH72Kut3MudqpvTvH2WEH0hnip44oQVIcfkDAP3Nw6ySkI/O39Vnr//12M+JhghsrkKAcvGNsEvrTHNNfhSRkcjSYSPNhyj2i6HPeEGU/YUmUEsxm20OqmHfLXrSw/K2I2PPrYS81j2D19qeWmrp6xzN+ELx0b4Rgvv84W4SpZIDS9fo1nr5+TCVdjukF2NFS5/JuUk9xsSrI5TaQCX7v8jbRpVXn18ZYbAvxY17kg/DxfRyN1JBXACxWKhCtnFI+UGtyMRbZJ2qqWkjqO6YCMELOi85ARyEo1wLUBBiszeykpya/T42Dl+2uEWnC7JYyFxRuNHUmG6tmdKs0vB6CwNEj7Dy5LHr3D598L0shdi7SPdBvaeuCDs6csb4F0oN8Pu2MndCSlTvoi5XV8w6KZSRQBjS904DSuBBMT/bz7L6p57+8ViS4nCRu7VU7yV92z0GvaDTpeUUG/Q5H9JLwnaer8pyYsA7a0ZlU9BzSDPdQLDssdK6fXxpvd+wk54al816rTkOpWfab+4b6+eKCRUBD2geLemCronXJyu6vq8PCbG6PMV9uOuz+UVPVy+DHseYtZPE6KMITqJR7lZfh+M4qhb0UUh4WnzwViD19c22tGkJlQCSNsP+wC7v6usRkVmKZQevggHomxcfr4Eb/yFgIP6w== LabGuest Provisioning Key
5. Create `output.tf` to output public_ip of compute instance
6. Create modules of the different resources that you are using. Grading will also be done based on how modularised and reusable your code is.


# Ansible

Before beginning ansible section
1. Under ansible directory, create a role to:
    1. Configure the instance so that you are able to deploy and execute the programming challenge
1. Create a role to:
    1. Ping the instance created in the private subnet.
    1. Ping the instance and dump the output on the console.
1. Create a single playbook to execute the above mentioned roles
