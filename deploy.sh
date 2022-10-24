#!/bin/sh

repo_url='https://github.com/vidia/vidia.github.io.git'

ssh_host=''
tmp_path=''
www_path=''

print_usage() {
	echo "Usage: deploy.sh -s [prod host] -t [tmp path] -w [www path]"
}

while getopts 's:t:w:h' flag; do
	case "${flag}" in
		s) ssh_host="${OPTARG}" ;;
		t) tmp_path="${OPTARG}" ;;
		w) www_path="${OPTARG}" ;;
		h) print_usage
			exit 1 ;;
		*) print_usage
			exit 1 ;;
	esac
done

if [ -z ${ssh_host} ]; then
       echo "You must enter a hostname to deploy to"
       print_usage
       exit 1
fi       

if [ -z ${tmp_path} ]; then
       echo "You must enter a temporary path to clone to"
       print_usage
       exit 1
fi       

if [ -z ${www_path} ]; then
       echo "You must enter the path to copy the site's files to"
       print_usage
       exit 1
fi       

echo "You have entered."
echo "host: " ${ssh_host}
echo "tmp: " ${tmp_path}
echo "www: " ${www_path}

# Sign in and start the deploy.

echo "Connecting to " ${ssh_host} " using ssh"

ssh $ssh_host << ENDSSH

cd /tmp
echo "Hello World from " ${ssh_host}
ls /tmp

ENDSSH
