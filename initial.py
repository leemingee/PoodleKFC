import cv2
import numpy as np
from matplotlib import pyplot as plt

'''
filename = '/Users/wanrenzhifeng/Git-leemingee/PoodleKFC/Data/train/images/0001.jpg'
img = cv2.imread(filename, 0)
cv2.imshow('image', img)
cv2.waitKey(1000)
cv2.destroyAllWindows()
'''

'''

filename = '/Users/wanrenzhifeng/Git-leemingee/PoodleKFC/Data/train/images/0001.jpg'
img = cv2.imread(filename, 0)
plt.imshow(img, cmap='gray', interpolation='bicubic')
plt.xticks([]), plt.yticks([])
plt.show()

'''

'''
filename = '/Users/wanrenzhifeng/Git-leemingee/PoodleKFC/Data/train/images/0001.jpg'
img = cv2.imread(filename, 0)
gray= cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
sift = cv2.xfeatures2d.SIFT_create()
kp = sift.detect(gray,None)
img=cv2.drawKeypoints(gray,kp,img)
# cv2.imwrite('sift_keypoints.jpg',img)
'''
