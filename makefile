# Compiler to use ; GCC
CC = gcc

CFLAGS = -g -Wall -std=c99

# Library flags
LIBS = -lsndfile -lfftw3 -lm

vimplayer: fft.o voice_detect_vector.o core.o
	$(CC) $(CFLAGS) fft.o voice_vector.o subtitle_match.o $(LIBS) -o vimplayer

fft.o: fft.c
	$(CC) $(CFLAGS) -c fft.c

voice_detect_vector.o: voice_vector.c voice_vector.h
	$(CC) $(CFLAGS) -c voice_vector.c

core.o: subtitle_match.c
	$(CC) $(CFLAGS) -c subtitle_match.c

# To clean up, remove all the object files and backup files
clean:
	$(RM) vimplayer *.o *~ 
