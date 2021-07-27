setup_project: create_secret create_config_map create_database_deployment create_deployment

create_deployment:
	@kubectl apply -f kubernetes/chefio-deployment.yml

create_database_deployment:
	@kubectl apply -f kubernetes/chefio-database-deployment.yml

create_secret:
	@kubectl apply -f kubernetes/chefio-secret.yml

create_config_map:
	@kubectl apply -f kubernetes/chefio-config-map.yml