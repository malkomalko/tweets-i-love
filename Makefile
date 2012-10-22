vc:
	@rake generate template=vc klass=${NAME}

tvc:
	@rake generate template=tvc klass=${NAME}

stvc:
	@rake generate template=stvc klass=${NAME}

.PHONY: vc tvc stvc
