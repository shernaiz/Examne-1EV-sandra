;
; Bind data file for tendaelectronica.int
;

$TTL	604800
@	IN	SOA	tendaelectronica.int root.tendaelectronica.int. (
			      2	       ; Serial
			 604800	       ; Refresh
			  86400	       ; Retry
			2419200	       ; Expire
                         604800 )      ; Negative Cache TTL

@	IN	NS	ns.tendaelectronica.int.
@	IN	A	owncloud
@	IN	AAAA	::1
ns	IN	A	172.16.0.1	
