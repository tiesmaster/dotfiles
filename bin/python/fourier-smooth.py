## demonstrate smoothing by fourier analysis -- generate some noisy
## data and then smooth it out
## to run it:
## python fourier-smooth.py
## gnuplot
## gnuplot> plot 'noisy.dat-smooth' using 1:2 with lines
## gnuplot> replot 'noisy.dat-smooth' using 1:4 with lines

import math
import random
import string
import numpy

fname = 'noisy.dat'

def __main__():
  t = []
  x = []
  gen_noisy_data(fname)                 # prepare a noisy file
  ## now read that in
  for line in open(fname, 'r').readlines():
    fwords = map(float, string.split(line))
    t.append(fwords[0])
    x.append(fwords[1])
  N = len(x)
  ## get the fourier transform
  x_hat = numpy.fft(x, N)
  ## now set the higher order terms in the fourier transform to 0
  ## which will smooth the signal out
  x_hat[100:] = 0.0
  ## now obtain a new array of smoothed data
  x_smooth = numpy.fft(x_hat, N, -1).real
  print x_hat
  print x_smooth
  f_smooth = open(fname + '-smooth', 'w')
  for i in range(N):
    f_smooth.write('%d   %g  %g  %g\n' % (i, x[i], x_hat.real[i], 2.0*x_smooth[i]/N))
  f_smooth.close()

## generate a sine wave with noise
def gen_noisy_data(fname):
  f = open(fname, 'w')
  for i in range(1000):
    t = i/30.0
    x = math.sin(t) + random.uniform(-0.2, 0.2)
    print t, x
    f.write('%g   %g\n' % (t, x))
  f.close()
    

__main__()
