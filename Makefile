serve:
	hugo serve

build:
	hugo

sync:
	 rsync -ravp public/ moon1:/opt/hanami/shared/public/blog/

deploy: build sync
