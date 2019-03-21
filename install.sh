#!/usr/bin/env bash

_basePath=$(cd `dirname $0`; pwd)
_scrDir=$_basePath/software
_confDir=$_basePath/conf

#带颜色提示文字
msgGreen(){
	echo -e "\e[1;32m$1\e[0m"
}

#错误提示文字
msgErr(){
	echo -e "\e[1;31m$1\e[0m"
}


install_py(){
	#安装依赖
	yum -y install gcc automake autoconf libtool make
	yum install vim wget gcc gcc+ gcc-c++ zlib-devel openssl-devel libffi-devel -y
	cd $_scrDir
	tar -zxvf Python-3.6.4.tgz
	cd Python-3.6.4/
	./configure --prefix=/usr/local/python3 --enable-shared --with-ssl
	make && make install
	echo "/usr/local/python3/lib" > /etc/ld.so.conf.d/python3.conf
	ln -s /usr/local/python3/bin/python3 /usr/bin/python3
	ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
	ldconfig
	cd $_scrDir
	rm -rf Python-3.6.4 
}


clear

echo -e "\e[1;36m =================================================================== \e[0m"
sleep 0.03
echo -e "\e[1;36m|              \e[1;31mQiShon DataBase OpWeb Installation                   \e[1;36m|\e[0m"
sleep 0.03
echo -e "\e[1;36m|                             \e[1;33mv1.0                                  \e[1;36m|\e[0m"
sleep 0.03
echo -e "\e[1;36m|  Author:\e[1;32mSetsuna                                                   \e[1;36m|\e[0m"
sleep 0.03
echo -e "\e[1;36m|  Date  :\e[1;35m2018-08-24                                                \e[1;36m|\e[0m"
sleep 0.03
echo -e "\e[1;36m =================================================================== \e[0m"

#获取当前用户
_usr=`whoami`

if [ $_usr != "root" ]; then
	msg_err " 抱歉，只有root账户才能执行操作！"
	exit 1;
fi

install_py

pip3 install --upgrade pip

yum install -y python-virtualenv

cd /home

mkdir saleforecastobject

cd saleforecastobject

virtualenv -p /usr/bin/python3 venv

source venv/bin/activate

pip3 install --upgrade pip
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pymysql
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple requests
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple datetime
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pandas
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple keras
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple sklearn
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple sqlalchemy

msgGreen "安装完毕"


