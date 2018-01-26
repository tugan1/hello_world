# hello_world
hello world


compile files:
g++ -c src/main.cpp -o bin/main.o
g++ -c src/show_time.cpp -o bin/show_time.o

link files:
g++ bin/show_time.o bin/main.o -o bin/main.exe