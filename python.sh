# 从源码安装 python 3.6.5
#_bz2                _curses           _curses_panel
#_dbm                _gdbm             _lzma
#_sqlite3            _tkinter          readline
sudo apt-get install -y libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev libreadline-dev
cd /tmp && wget http://mirrors.sohu.com/python/3.6.5/Python-3.6.5.tgz && \
    tar -xzvf Python-3.6.5.tgz && cd /tmp/Python-3.6.5 && \
    ./configure --prefix="/usr/local" --enable-shared LDFLAGS="-Wl,--rpath=/usr/local/lib" && \
    make -j8 && sudo make install

# 从源码安装 python 2.7.14
#_bsddb             _curses            _curses_panel
#_sqlite3           _tkinter           readline
#bz2                dbm                gdbm
# sunaudiodev and bsddb185 and dl and imageop are ignored
sudo apt-get install -y libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev libreadline-dev libdb-dev
cd /tmp && wget http://mirrors.sohu.com/python/2.7.14/Python-2.7.14.tgz && \
    tar -xzvf Python-2.7.14.tgz && cd /tmp/Python-2.7.14 && \
    ./configure --prefix="/usr/local" --with-ensurepip=install --enable-unicode=ucs4 && \
    make -j8 && sudo make install

