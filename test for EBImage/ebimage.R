library(EBImage)
img <- readImage("chicken.jpg")
print(img) # returns the pixel value, and largr values for pixel make more white
display(img) # interactive JS viewer
options("EBImage.display"= "raster") 

# using default packages
load("zipcode.RData")
dat[1:5, 1:5]
n_r <- n_c <- 16
vec <- dat[70,]
M <- matrix(vec, n_r, n_c)
MM <- M[,rev(1:ncol(M))]
par(mfrow=c(1,2))
image(x=1:n_r, y=1:n_c, z=M, axes = FALSE, xlab="", ylab="", col = grey(seq(0, 1, length = 256)))
image(x=1:n_r, y=1:n_c, z=MM, axes = FALSE, xlab="", ylab="", col = grey(seq(0, 1, length = 256)))
par(mfrow=c(1,1))
img_zip <- Image(vec, dim=c(16, 16))
display(img_zip)

str(img)
dim(img) # The third dimension is the slot for the three channels: Red, Green and Blue
imageData(img) # can use the image as the 3-dimensional matrix

Sys.time()
hist(img) # show the hist for three channels' values
Sys.time()

# resize the images
img_small <- resize(img, 128, 128) # download sample algorithm
display(img_small)

# Combine the image 
img_dog <- readImage("dog.jpg")
img_dog <- resize(img_dog, 128, 128)
img_all <- EBImage::combine(img_small, img_dog) # really generate a new image
display(img_all, all=TRUE)

# adjust the brightness [todo]what the meaning of it for the image process?
img_bright <- img + 0.2
img_dark <- img - 0.2
display(combine(img_bright, img_dark), all=TRUE)

##[todo] the image stored in this is 186.6Mb,  but this is just a 552kb file.

## adjust the contrastness
img_low <- img * 0.5
img_high <- img * 2
display(combine(img_low, img_high), all=TRUE)

# corp the image (just subset a matrix)
display(img[300:450, 50:200,])

# transform the image
img_rotate <- translate(rotate(img, 45), c(50, 0))
display(img_rotate)

# different color channels
display(channel(img, mode='gray')) # use the grey channel, which is the average of RBG three channels
display(channel(img, mode='luminance')) # this method, the weight of three channels differ
display(channel(img, mode='asred'))

###### filter ######
# linear
# non-linear: median
## filtering the most important one in this test
w <- makeBrush(size = 31, shape = 'gaussian', sigma = 5)
plot(w[(nrow(w)+1)/2, ], ylab = "w", xlab = "", cex = 0.7)
img_flo <- filter2(img, w)
display(img_flo)
## each pixel will be more closer to each other
f_low <- makeBrush(21, shape='disc', step=FALSE)
display(f_low, title='Disc filter')
# Low-pass linear filtering: to blur images, remove noise…
f_high <- matrix(1, nc=3, nr=3)
f_high[2,2] <- -8
img_highPass <- filter2(img, f_high)
display(img_highPass, title='Filtered image')
# High-pass Laplacian filtering: to detect edges, sharpen images

# [todo] it's really obvious that there is a shortcoming of this package:
# The space cost for this package and cooresponding class is sooooo inefficient
## add some noise
l = length(img)
n = l/10
pixels = sample(l, n)
img_noisy = img
img_noisy[pixels] = runif(n, min=0, max=0.5)
display(img_noisy)
## try to remove it
img_median = medianFilter(img_noisy, 1)
display(img_median)


