# Labels

## deployment_id
label_values(up{job="ec2-instance-metrics",service_name="eligsvc"}, deployment_id)

## deployment_num
label_values(container_last_seen{image!="",service_name="eligsvc",deployment_id!="",container_label_deployment_id=""}, deployment_id)
