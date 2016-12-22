BREW_SERVICES = brew services
start:
	@$(BREW_SERVICES) start elasticsearch@2.4
	@$(BREW_SERVICES) start memcached
	@$(BREW_SERVICES) start postgresql
	@$(BREW_SERVICES) start redis

stop:
	@$(BREW_SERVICES) stop elasticsearch@2.4
	@$(BREW_SERVICES) stop memcached
	@$(BREW_SERVICES) stop postgresql
	@$(BREW_SERVICES) stop redis
