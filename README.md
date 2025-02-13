# Devops 2025 Mythics Interview Challenge Terraform

> Forked from: https://github.com/praveenmogili/devops-2023 <br/>
> Authors: Praveen Mogili, Zeinab El-Rewini, Faris Durrani (Mythics, LLC)

Mythics DevOps Interview Challenge to provision resources using Terraform, Python, and Ansible

## Objective

1. Solve the programming challenge
1. Create the resources on Oracle Cloud using Terraform
1. Create Ansible roles and playbooks to perform tasks

## Rules

1. Open-book, open-internet, open-AI
1. No collaboration with live humans

## Python Programming Challenge

Write a program in Python (3.6+) to accept an interactive input keyword string and by using that read string, search through the data loaded from a json file : [problem.json](problem.json) and print out the URL name if an input string matches part of the API name and/or Description.

## Terraform

1. Refer to the file [Steps to Access Oracle Cloud.md](./Steps%20to%20Access%20Oracle%20Cloud.md) to ensure you can login to the Oracle Cloud
1. Create the following resources, which are shown in the pdf file [demo-stack-diagram.pdf](./demo-stack-diagram.pdf)
   - VCN `IC_VCN`
   - Subnets `IC_pub_snet-A` and `IC_pvt_snet-B`
   - Gateways `IC_IG-A` and `IC_SG-A`
   - Compute instances `ic_pub_vm-A`, `ic_pvt_vm-B`, and `ic_pvt_vm-C`
1. Make sure to use the following variables in your terraform code:
   - Compartment ID : `ocid1.compartment.oc1..aaaaaaaawegp67yo7ggm6q2ywen2el27udvqjwpmn5uuyfhydusai55yrepa`
   - Image ID : `ocid1.image.oc1.iad.aaaaaaaawoewdiy5y3abewk3byd6456ry5qsphzsm6mjw7jcwnxobs2c7jjq` (Oracle-Linux-8.10-2024.11.30-0)
   - Shape : `VM.Standard.E5.Flex`
   - Availability Domain : `ktgl:US-ASHBURN-AD-2`
1. Configure the route tables, security lists, and network security groups:
   - Route table `ic_pub_rt-A` should include a route rule allowing use of the Internet gateway
   - Route table `ic_pvt_rt-B` should include a route rule allowing use of the Service gateway
   - Security list `ic_pub_sl-A` should allow:
     - outgoing ssh traffic to subnet `IC_pvt_snet-B`
     - outgoing icmp traffic to compute instance `ic_pvt_vm-B`
     - incoming ssh traffic from the internet
   - Security list `ic_pvt_sl-B` should allow:
     - outgoing traffic to `all-iad-services-in-oracle-services-network`
     - incoming ssh traffic from subnet `IC_pub_snet-A`
   - Network security group `ic_pvt_nsg-B` should allow ICMP traffic from `IC_pub_snet-A` _only_ to the compute instance `ic_pvt_vm-B`
1. Modify the public compute instance's metadata to add your ssh public key and also add the public key (we'll give it to you) to the private compute instance for grading purposes.
1. Create `output.tf` to output public_ip of compute instance
1. Create modules of the different resources that you are using. Grading will also be done based on how modularized and reusable your code is.

## Ansible

Create a single playbook to execute the below tasks from within the public instance. Show the terminal output of the playbook execution.

1.  Ping the private instance from private instance.
1.  Run the python program. To accept the input, feel free to use the `expect` module or modify it to accept command line arguments.
