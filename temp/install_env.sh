# Create "Download" folder
mkdir -p downloads
cd downloads

export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh -b
export ANACONDA_HOME=$HOME/anaconda3/bin
export PATH=$CUDA_HOME/bin:$ANACONDA_HOME:$PATH

# Write to Bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=${CUDA_HOME}/lib64' >> ~/.bashrc
echo 'export ANACONDA_HOME=$HOME/anaconda3/bin' >> ~/.bashrc
echo 'export PATH="$CUDA_HOME/bin:$ANACONDA_HOME:$PATH"' >> ~/.bashrc

conda install -y bcolz
conda install -y opencv
conda upgrade -y --all

# Deep Learning Libraries Python

# - Install Theano with libgpuarray
git clone https://github.com/Theano/libgpuarray.git
cd libgpuarray
mkdir Build
cd Build
# you can pass -DCMAKE_INSTALL_PREFIX=/path/to/somewhere to install to an alternate location
#cmake .. -DCMAKE_BUILD_TYPE=Release # or Debug if you are investigating a crash
cmake .. -DCMAKE_INSTALL_PREFIX=~/.local -DCMAKE_BUILD_TYPE=Release
make
make install
cd ..

# Run the following export and add them in your ~/.bashrc file
export CPATH=$CPATH:~/.local/include
export LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib

echo 'export CPATH=$CPATH:~/.local/include' >> ~/.bashrc
echo 'export LIBRARY_PATH=$LIBRARY_PATH:~/.local/lib' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib' >> ~/.bashrc

# pygpu
python setup.py build
python setup.py install

cd ..  # back to download

pip install theano
echo "[global]
device = cuda0
floatX = float32

[lib]
cnmem = 1.0" > ~/.theanorc

wget https://www.dropbox.com/s/vkgthoixa6b99te/tensorflow-1.2.1-cp35-cp35m-linux_x86_64.whl?dl=0 -O tensorflow-1.2.1-cp35-cp35m-linux_x86_64.whl
pip install tensorflow-1.2.1-cp35-cp35m-linux_x86_64.whl # tensorflow 1.2.1 CUDA 8.0 and cuDnn 5.1

# cntk
pip install https://cntk.ai/PythonWheel/GPU/cntk-2.0-cp35-cp35m-linux_x86_64.whl

pip install keras
mkdir -p ~/.keras
echo '{
    "image_data_format": "channels_last",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "tensorflow"
}' > ~/.keras/keras.json

# Jupyter Notebook (server conf)
jupyter notebook --generate-config
jupass=`python -c "from notebook.auth import passwd; print(passwd())"`
cd ~
echo "c.NotebookApp.password = u'"$jupass"'" >> .jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'
c.NotebookApp.port = 9999
c.NotebookApp.notebook_dir = '$HOME/notebooks/'
c.NotebookApp.open_browser = False" >> .jupyter/jupyter_notebook_config.py
mkdir -p notebooks

