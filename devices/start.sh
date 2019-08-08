counter=1
while [ $counter -le 10 ]
do
	echo $counter
	git clone https://github.com/lmokto/fake-devices.git dev$counter
	sed -i "s@NAME@lmokto@" ./dev$counter/src/main.cpp
	sed -i "s@ACCOUNT@depto$counter@" ./dev$counter/src/main.cpp
	sed -i "s@TOKEN@test123@" ./dev$counter/src/main.cpp
	((counter++))
done
echo All done