(cd libevent-2.0.22-stable && ./configure --prefix=$PWD/../build/ && make -j4 && make install)
(cd ncurses && ./configure --prefix=$PWD/../build/ && make -j4 && make install)
(cd tmux-2.2 && ./configure --prefix=$PWD/../build/ CFLAGS="-I$PWD/../build/include -I$PWD../build/include/ncurses" LDFLAGS="-static -L$PWD/../build/lib" && \
    make -j4 && make install )
