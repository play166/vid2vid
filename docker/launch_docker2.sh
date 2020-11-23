# Thanks @dustinfreeman for providing the script
#!/bin/bash
sudo nvidia-docker build --build-arg HTTP_PROXY=192.168.0.107:8000 -t vid2vid:CUDA9-py35 ./docker/

sudo nvidia-docker run --rm -ti --ipc=host --shm-size 8G -v $(pwd):/vid2vid --workdir=/vid2vid play166/vid2vid:CUDA9-py35 /bin/bash
sudo docker run --gpus all --rm -ti --ipc=host --shm-size 8G -v $(pwd):/vid2vid --workdir=/vid2vid play166/vid2vid:CUDA9-py35 /bin/bash

apt install libgl1-mesa-glx











