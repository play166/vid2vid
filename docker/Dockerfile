FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
  
ENV CUDA_HOME=/usr/local/cuda

RUN apt-get update && apt-get install -y rsync htop git openssh-server
RUN cd /
RUN git clone https://github.com/play166/vid2vid.git
RUN cd /vid2vid

RUN apt-get install python3-pip -y
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install --upgrade pip

#Torch and dependencies:
RUN pip install https://download.pytorch.org/whl/cu100/torch-1.0.0-cp35-cp35m-linux_x86_64.whl
# RUN pip install http://download.pytorch.org/whl/cu90/torch-1.0.0-cp35-cp35m-linux_x86_64.whl
RUN pip install torchvision==0.2.1
RUN pip install cffi tensorboardX
RUN pip install tqdm scipy scikit-image colorama==0.3.7
RUN pip install setproctitle pytz ipython

#vid2vid dependencies
RUN apt-get install libglib2.0-0 libsm6 libxrender1 -y
RUN pip install dominate requests opencv-python

RUN apt-get install libgl1-mesa-glx -y
RUN apt-get install build-essential -y
RUN apt-get install cmake -y
RUN pip install dlib
RUN apt-get install vim -y

#pix2pixHD, required for initializing training
RUN git clone https://github.com/NVIDIA/pix2pixHD /pix2pixHD

RUN ls -al

#vid2vid install
# RUN git clone https://github.com/play166/vid2vid.git /vid2vid
WORKDIR /vid2vid
#download flownet2 model dependencies
#WARNING: we had an instance where these scripts needed to be re-run after the docker instance was launched


RUN export CUDA_HOME=/usr/local/cuda

RUN python scripts/download_flownet2.py
RUN python scripts/download_models_flownet2.py

RUN python scripts/download_datasets.py
RUN python scripts/face/download_models.py

# make train/test face landmark
RUN python data/face_landmark_detection.py train
RUN python data/face_landmark_detection.py test

# RUN python train.py --name edge2face_512 --dataroot datasets/face/ --dataset_mode face --input_nc 15 --loadSize 512 --num_D 3 --gpu_ids 0 --n_gpus_gen 1 --n_frames_total 1
# min run train
# RUN python train.py --name edge2face_512 --dataroot datasets/face/ --dataset_mode face --input_nc 15 --loadSize 256 --num_D 3 --gpu_ids 0 --n_gpus_gen 1 --n_frames_total 1
# RUN nvidia-smi
RUN ls -al
RUN git pull
RUN python scripts/download_vgg.py







