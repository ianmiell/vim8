# http://vimhelp.appspot.com/version8.txt.html
FROM ubuntu
RUN apt-get update -y && apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev git
RUN apt-get remove -y vim vim-runtime gvim
RUN git clone https://github.com/vim/vim.git
WORKDIR vim
RUN ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
RUN make VIMRUNTIMEDIR=/usr/share/vim/vim8
RUN make install
CMD bash
