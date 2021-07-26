
.PHONY : main
main:
	echo "ran makefile" > ./log.txt
	echo $$USER >> ./log.txt
	/snap/bin//hugo -D >> ./log.txt 2>&1
	rsync -r ./public/ website:/home/opc/www >> ./log.txt 2>&1
	#/usr/bin/notify-send "website updated"
	/usr/bin/zenity --notification --text "asdf"
	
.PHONY : push
push: 
	git add .
	git commit -m "$$(date +%F-%T)"
	git push
