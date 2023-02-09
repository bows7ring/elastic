for i in {1..20}
do 
#	echo $i
	./local-auto > ~/work/new.txt 
	sleep 2
       	python3 ~/work/2.py ~/work/new.txt

done
