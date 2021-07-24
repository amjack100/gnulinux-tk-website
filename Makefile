
main:
	echo "ran makefile" > ./log.txt
	/snap/bin//hugo -D >> ./log.txt 2>&1
	rsync -r ./public/ website:/home/opc/www >> ./log.txt 2>&1
