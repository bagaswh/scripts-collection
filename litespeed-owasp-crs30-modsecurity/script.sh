#!/bin/bash

apt-get install -y git

script_dir=$(dirname "$0")
echo 'script dir:' $script_dir
mkdir $script_dir/tmp
ls

apt-get install -y ols-modsecurity

git clone https://github.com/coreruleset/coreruleset $script_dir/tmp/coreruleset
mv $script_dir/tmp/coreruleset/crs-setup.conf.example $script_dir/tmp/coreruleset/crs-setup.conf
mv $script_dir/tmp/coreruleset/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example $script_dir/tmp/coreruleset/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
mv $script_dir/tmp/coreruleset/rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf.example $script_dir/tmp/coreruleset/rules/RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf

mkdir -p /usr/local/lsws/modsec/owasp/crs30
mv $script_dir/tmp/coreruleset/* /usr/local/lsws/modsec/owasp/crs30
mv $script_dir/owasp-master.conf /usr/local/lsws/modsec/owasp/crs30
cat $script_dir/mod_security.conf >> /usr/local/lsws/conf/httpd_config.conf
