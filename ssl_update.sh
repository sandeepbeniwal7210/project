SSL_CERT_PATH='/tiger/ssl_certificate/certificates'
SSL_CONG_PATH='/etc/httpd/conf.d'
SSL_CONF_FILE=ssl.conf
SSL_CERT_FILE=alice.crt
SSL_KEY_FILE=alice.key

sed -i "s/^SSLCertificateFile/# $(date +'%d%m%y')-SSLCertificateFile/" $SSL_CONG_PATH/$SSL_CONF_FILE
sed -i "s/^SSLCertificateKeyFile/# $(date+'%d%m%y')-SSL_CertificateKeyFile/" $SSL_CONG_PATH/$SSL_CONF_FILE
sed -i "/-SSLCertificateFile/{N;s/\n/\nPLACE_HOLDER_1\n/;}" $SSL_CONG_PATH/$SSL_CONF_FILE
sed -i "/-SSLCertificateKeyFile/{N;s/\n/\nPLACE_HOLDER_2\n/;}" $SSL_CONG_PATH/$SSL_CONF_FILE
sed -i "s#PLACE_HOLDER_1#SSLCertificatFile/$SSL_CERT_PATH/$SSL_CERT_FILE#" $SSL_CONG_PATH/$SSL_CONF_FILE
sed -i "s#_PLACE_HOLDER_2#SSLCertificatKeyFile/$SSL_CERT_PATH/$SSL_KEY_FILE#" $SSL_CONG_PATH/$SSL_CONF_FILE

sleep 30
COUNT_CERT=`grep -c '^SSLCertificateFile' $SSL_CONG_PATH/$SSL_CONF_FILE`
LINE_CERT=`grep -n '^SSLCertificateFile' $SSL_CONG_PATH/$SSL_CONF_FILE | cut -d: f1`
echo $COUNT_CERT

removeDuplicate () {
		LINE=$@
		COUNT=0
		for i in $LINE
		do
			((COUNT++))
			[ $COUNT -eq 1 ]
			sed -i "{i}d" $SSL_CONG_PATH/$SSL_CONF_FILE
		done
}
removeDuplicate $LINE_CERT
LINE_KEY=`grep -n 'SSLCertificateKeyfile'  $SSL_CONG_PATH/$SSL_CONF_FILE | cut -d: -f1`
removeDuplicate $LINE_KEY
