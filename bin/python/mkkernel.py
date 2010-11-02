#!/usr/bin/env python

import shutil
import os
import sys
import glob
import pdb

def post_mortem(*dummy):
	print "This script entered a unhandled exception," \
		" the post mortem debbuger willl be called:"
	pdb.traceback.print_exc()
	pdb.pm()

#sys.excepthook = post_mortem

#constants

latest = "latest"
config_dir = "/etc/kernels/"
config_prefix = "kernel-config-x86-"

source_dir = "/usr/src/"
latest_source = source_dir + "linux/"
source_prefix = "linux-"

image_path = latest_source + "arch/i386/boot/"
my_image = image_path + "bzImage"

map = "System.map"
my_map = latest_source + map

target_dir = "/boot/"
target_image = "kernel-"

def sort_kernel_list (kernel_list):
	# orders the list given in kernel_list, oldest and smallest kernel
	# version first in output list.
	kernel_list.sort()
	return kernel_list[-1]

def get_latest_version():
	# get's the latest version of the kernel
	kernel_list = glob.glob(source_dir + source_prefix + '*')
	# strip the leading '/usr/src/linux-'
	#pdb.set_trace()
	#kernel_list = map(lambda kernel: kernel.replace(source_dir + source_prefix, ''), kernel_list)
	for i in range(len(kernel_list)):
		kernel_list[i] = kernel_list[i].replace(source_dir + source_prefix, '')
	return sort_kernel_list(kernel_list)
	#should work, not tested yet
	#return sort_kernel_list(map(lambda kernel:
	#	kernel.replace('/usr/src/linux-', ''), glob.glob(source_dir +
	#		source_prefix + '*'))

if __name__ == '__main__':
	#my constants
	latest_version = get_latest_version()

	my_config = config_dir + config_prefix + latest_version
	latest_config = config_dir + config_prefix + latest

	#my_source = source_dir + source_prefix + latest_version

	my_target_image = target_dir + target_image + latest_version
	latest_target_image = target_dir + target_image + latest

	my_target_map = target_dir + map + "-" + latest_version
	latest_target_map = target_dir + map + "-" + latest

	#program starts here
	print "Latest version: ", latest_version

	#get latest config
	shutil.copyfile(latest_config, latest_source + ".config")

	os.chdir(latest_source)
	os.system("make oldconfig")
	#os.system("make menuconfig")

	#save the config + make symlink
	shutil.copyfile(latest_source + ".config", my_config)
	if os.path.islink(latest_config):
		os.unlink(latest_config)
	os.symlink(config_prefix + latest_version, lastest_config)

	os.system("make")
	os.system("make modules_install")

	os.system("mount /boot")

	shutil.copy(my_image, my_target_image)
	if os.path.islink(latest_target_image):
		os.unlink(latest_target_image)
	os.symlink(target_image + latest_version, latest_target_image)
	shutil.copy(my_map, my_target_map)
	if os.path.islink(latest_target_map):
		os.unlink(latest_target_map)
	os.symlink(map + "-" + latest_version, latest_target_map)

	os.system("umount /boot")

	latest_version = latest_version.replace('gentoo-', '')
	print "tsemerge -C", latest_version
	print "rm -rf", latest_version
