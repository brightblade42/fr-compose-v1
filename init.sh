 #!/bin/sh

install_compose() {
        echo "installing docker-compose.."
        curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
        ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
        docker-compose --version
}

uninstall_compose() {
        rm /usr/local/bin/docker-compose
        echo "docker-compose uninstalled"

}

extract_dbvol() {
        echo "extracting db volume to docker volume\n"
        tar -xzf dvol.tar.gz -C /var/lib/docker/volumes
}

up() {
        echo "initializing services...\n"
        cd fr-cpu
        docker-compose up -d

        echo "OK. ready"
}

down () {
	cd fr-cpu
	docker-compose down
}

install_compose
extract_dbvol
up
