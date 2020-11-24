import sys
from os.path import dirname

sys.path.append(dirname(__file__) + '/..')

print(sys.path)
from models import networks

criterionVGG = networks.VGGLoss()















