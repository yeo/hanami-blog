serve:
	hugo serve

build:
	hugo

deploy:
	 rsync -ravp public/ moon1:/opt/hanami/shared/public/blog/
