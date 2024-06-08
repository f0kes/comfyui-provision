#!/bin/bash

cd /workspace/ComfyUI/custom_nodes
git clone https://github.com/MrForExample/ComfyUI-3D-Pack
cd ComfyUI-3D-Pack
pip install -r requirements.txt
git clone --recursive https://github.com/ashawkey/diff-gaussian-rasterization
pip install ./diff-gaussian-rasterization
pip install ./simple-knn

git clone --recursive https://github.com/NVlabs/nvdiffrast/
pip install ./nvdiffrast

# Install pointnet2_ops
cd tgs/models/snowflake/pointnet2_ops_lib
python setup.py install
cd ../../../../

pip install git+https://github.com/rusty1s/pytorch_scatter.git
pip install 'git+https://github.com/facebookresearch/detectron2.git'
import sys
import torch
pyt_version_str=torch.__version__.split("+")[0].replace(".", "")
version_str="".join([
    f"py3{sys.version_info.minor}_cu",
    torch.version.cuda.replace(".",""),
    f"_pyt{pyt_version_str}"
])
pip install --no-index --no-cache-dir pytorch3d -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/{version_str}/download.html
