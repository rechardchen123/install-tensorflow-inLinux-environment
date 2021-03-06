sudo yum -y install epel-release  
sudo yum -y install gcc gcc-c++ python-pip python-devel atlas atlas-devel gcc-gfortran openssl-devel libffi-devel
# use pip or pip3 as you prefer for python or python3
pip install --upgrade virtualenv
virtualenv --system-site-packages ~/venvs/tensorflow
source ~/venvs/tensorflow/bin/activate
pip install --upgrade numpy scipy wheel cryptography #optional
# python 3.6 -cpu version
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.11.0-cp36-cp36m-linux_x86_64.whl 
# or below if you want gpu, support, but cuda and cudnn are required, see docs for more install instructions
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.11.0-cp36-cp36m-linux_x86_64.whl

#if there are some problems when activate the tensorflow, you may need some dependencies to install.
sudo yum install python-dev python-pip  # or python3-dev python3-pip

#Install the TensorFlow pip package dependencies (if using a virtual environment, omit the --user argument):
pip install -U pip six numpy wheel mock
pip install -U keras_applications==1.0.5 --no-deps
pip install -U keras_preprocessing==1.0.3 --no-deps

# when running the tensorflow in ImportError: /lib64/libc.so.6: version `GLIBC_2.17' not found
wget https://ftp.gnu.org/gnu/glibc/glibc-2.17.tar.gz
tar -xvf glibc-2.17.tar.gz

cd glibc-2.17
mkdir build
cd build
../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make && make install

ll /lib64/libc.so.6

lrwxrwxrwx 1 root root  
/lib64/libc.so.6 -> libc-2.17.so
strings /lib64/libc.so.6 |grep GLIBC_


