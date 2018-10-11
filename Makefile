NAME=dustypi
VERSION=0.0.5

PKG_DIR=dusty
PKG_NAME=$(NAME)_$(VERSION)


all: $(NAME)

$(NAME): src/$(NAME) src/$(NAME).service src/$(NAME).conf src/$(NAME).1 LICENSE
	sh src/deb-packaging-dusty.sh
	mv $(PKG_NAME)-1_armhf.deb $(NAME)-$(VERSION)
	rm -rf $(NAME)_*

install:
	dpkg -i $(NAME)-$(VERSION)/$(PKG_NAME)-1_armhf.deb
	systemctl daemon-reload

clean:
	rm -rf $(NAME)-*
	rm -rf $(NAME)_*

.PHONY: check clean uninstall
