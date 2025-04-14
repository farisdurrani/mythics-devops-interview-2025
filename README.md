# Devops 2025 Mythics Interview Challenge Terraform

> Git repo: https://github.com/farisdurrani/mythics-devops-interview-2025 <br/>
> Forked from: https://github.com/praveenmogili/devops-2023 <br/>
> Authors: Praveen Mogili, Zeinab El-Rewini, Faris Durrani, Brody Clavel (Mythics, LLC)

Mythics DevOps Interview Challenge to provision resources using Terraform, Python, and Ansible

## Answers for Interviewers

See https://git.mythics.dev/fdurrani/answers-mythics-devops-interview-2025.

## Objective

1. Solve the programming challenge
1. Create the resources on Oracle Cloud using Terraform
1. Create an Ansible playbook to perform tasks

## Rules

1. Open-book, open-internet, open-AI
1. No collaboration with live humans

## Work environment
For this problemset we will provide command line interface and code editor within Oracle Cloud Infrastructure. The login page and credentials will be provided.

Once logged in you can click on developer tools where you can use cloud editor (code editor) and cloud shell (command line interface). You will see in the home directroy the code repository cloned where you can work through each problem.

## Python Programming Challenge

Write a program in Python to accept an interactive input keyword string and by using that read string, search through the data loaded from a json file : [problem.json](problem.json) and print out the URL name if an input string matches part of the API name and/or Description.

## Terraform

1. Provision the VCN with the code provided within the terraform directory.
2. Create the following resources, which are shown in the pdf file [demo-stack-diagram.png](./demo-stack-diagram.png)
   - Subnets `IC_pub_snet-A` 
   - Gateways `IC_IG-A`
   - Compute instance `ic_pub_vm-A`, `
3. Make sure to use the variables in locals.tf where applicable.
4. Configure the route tables and security lists:
   - Route table `ic_pub_rt-A` should include a route rule allowing use of the Internet gateway
   - Security list `ic_pub_sl-A` should allow:
     - outgoing traffic to all
     - incoming ssh traffic from the internet
5. Modify the public compute instance's metadata to add your ssh public key and also add the public key (we'll give it to you) to the private compute instance for grading purposes.
6. Create `outputs.tf` to output public_ip of compute instance


## Ansible

Create a single playbook to execute the below tasks from within the public instance. Show the terminal output of the playbook execution.

1.  On the public instance, `ic_pub_vm-A`, Create two groups named privileged and unprivileged. Add two users named admin and guest. Place the guest user in the unprivileged group and admin user in the privileged group.
