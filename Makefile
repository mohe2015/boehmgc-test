all:
	${CXX} -std=c++20 -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -I. -c lib.cpp
	${CXX} -std=c++20 -shared -g -O1 -fsanitize=address -I. -lgc -lgccpp -o liblib.so lib.o
	${CXX} -std=c++20 -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -I. -c main.cpp
	${CXX} -std=c++20 -Wall -Wextra -fno-omit-frame-pointer -g -O1 -fsanitize=address -I. -L${PWD} -Wl,-rpath=${PWD} -llib -lgc -lgccpp -o test main.o
	./test