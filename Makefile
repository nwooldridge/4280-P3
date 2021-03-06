CC=g++ -g -std=c++11
TARGET=statSem
OBJS=parser.o scanner.o statSem.o source.o

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS)

parser.o:
	$(CC) -c parser.cpp

scanner.o:
	$(CC) -c scanner.cpp

statSem.o:
	$(CC) -c statSem.cpp

source.o:
	$(CC) -c source.cpp

clean:
	rm -f *.o $(TARGET)
