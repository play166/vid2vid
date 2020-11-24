import sys
from os.path import dirname

sys.path.append(dirname(__file__) + '/..')

print(sys.path)
from models import networks

# criterionVGG = networks.VGGLoss()
from torchvision import models
vgg_pretrained_features = models.vgg19(pretrained=True)
















