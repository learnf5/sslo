The following table maps UCS file Loading and End-State for each SSLO Lab.

|Lab#|Lab Name|UCS Load|UCS End|
|:-----|:-----|:-----|:----|
|1.1|Confirm Provisioning and Network Configuration|sslo1_base.ucs|sslo1_sys_check.ucs|
|2.1|Import a Signed Certificate|sslo1_base.ucs|sslo1_cert.ucs|
|4.1|Create a Transparent Forward Proxy|sslo1_cert.ucs|sslo1_tf_proxy.ucs|
|5.1|Create an Explicit Forward Proxy|sslo1_tf_proxy.ucs|sslo1_ef_proxy.ucs|
|5.2|Stop a service for maintenance|sslo1_ef_proxy.ucs|sslo1_ef_proxy.ucs|
|6.1|Create a Gateway Reverse Proxy|sslo1_ef_proxy.ucs|sslo1_gw_proxy.ucs|
|6.2|Create an Existing Application|sslo1_gw_proxy.ucs|sslo1_ex_app.ucs|
|7.1|Identify Components|sslo1_ex_app.ucs|sslo1_id_comp.ucs|
|7.2|Create Application Reverse Proxy|sslo1_ex_app.ucs|sslo1_app_proxy.ucs|
|7.3|Enable and Test TLS v1.3|sslo1_app_proxy.ucs|sslo1_tls13.ucs|

sslo1_tls13.ucs		Manage a Security Policy

sslo1_app_proxy.ucs	Forward Proxy Authentication

N/A			Troubleshooting

sslo1_base.ucs		Deleting and Cleanup of Configurations

sslo1_ha.ucs		Configure High Availability
sslo2_ha.ucs

N/A			Create a Deployment and Synchronize HA
