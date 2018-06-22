name="wordpress"
type="salt"
salt_config=""
salt_config_dir="/srv/salt/conf"

entrypoint_salt(){
	echo "Installing saltstack"
   	sudo yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
	sudo yum -y install epel-release
   	sudo yum clean expire-cache 
	sudo yum -y install salt-minion
	sudo yum -y install GitPython
    sudo mkdir -p $salt_config_dir
    wget -c --directory-prefix=$salt_config_dir $salt_config 
    # exec the base 
    sudo salt-call --config-dir=/srv/salt/conf --local state.apply
}
case $type in
    "salt")
        echo "Using type salt for entrypoint"
	entrypoint_salt
        ;;
    *)
        echo "Unknown type for entrypoint"
        ;;
esac
