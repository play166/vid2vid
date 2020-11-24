# Thanks @dustinfreeman for providing the script
#!/bin/bash
sudo nvidia-docker build -t vid2vid:CUDA9-py35 ./docker/

sudo nvidia-docker run --rm -ti --ipc=host --shm-size 8G -v $(pwd)/share:/share --workdir=/vid2vid vid2vid:CUDA9-py35 /bin/bash
