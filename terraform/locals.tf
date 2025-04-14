locals {
    #For Resource Placement
    lab_user_cmp = "ocid1.compartment.oc1..aaaaaaaa5iou33qre5uczs2ehpa22urfotryd4d4dyycvg54udxclty6owka"

    #For Compute Instance
    shape = "VM.Standard.E5.Flex"
    image = "ocid1.image.oc1.iad.aaaaaaaawoewdiy5y3abewk3byd6456ry5qsphzsm6mjw7jcwnxobs2c7jjq"
    availability_domain = "ktgl:US-ASHBURN-AD-1"
    fault_domain = "FAULT-DOMAIN-1"
}