
.PHONY : main push

main:
	echo "$$(date)" > ./log.txt
	/snap/bin//hugo -D >> ./log.txt 2>&1
	ls .public >> ./log.txt
	rsync -vr .public/ website:/home/opc/www
	
push: 
	git add .
	git commit -m "$$(date +%F-%T)"
	git push
