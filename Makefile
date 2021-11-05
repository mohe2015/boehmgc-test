all:
	${CXX} -std=c++20 -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -c lib.cpp
	${CXX} -std=c++20 -shared -g -O1 -fsanitize=address -lgc -lgccpp -o liblib.so lib.o
	${CXX} -std=c++20 -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -c main.cpp
	${CXX} -std=c++20 -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -L${PWD} -Wl,-rpath=${PWD} -llib -lgc -lgccpp -o test main.o
	./test