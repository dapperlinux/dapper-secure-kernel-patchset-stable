DATE=`date +%Y-%m-%d`
KERNEL_MAJOR_VERSION=4.9
KERNEL_VERSION=4.9.102

echo "Removing old kernels..."
rm -rf test
rm test.log
rm omit.log
mkdir test
cd test

echo "Uncompressing fresh kernel..."
tar -xf ../kernel/linux-$KERNEL_MAJOR_VERSION.tar.xz

echo "Uncompressing fresh kernel subpatches..."
unxz -k ../kernel/patch-$KERNEL_VERSION.xz

cd linux-$KERNEL_MAJOR_VERSION

echo "Patching minor kernel version..."
patch -F 0 -p1 < ../../kernel/patch-$KERNEL_VERSION >> ../../test.log

echo "Omitting patches..."
sh ../../omitted-patches/omit-patches.sh >> ../../omit.log

echo "Omitted patch failures..."
grep "saving rejects" ../../omit.log

echo "Patching Dapper Secure Kernel Patches..."
patch -F 0 -p1 < ../../dapper-secure-kernel-patchset-test.patch >> ../../test.log

echo "Showing failures..."
grep "saving rejects" ../../test.log

echo "Number of files failed..."
grep "saving rejects" ../../test.log | wc -l

echo "Number of hunks failed..."
grep "saving rejects" ../../test.log | cut -f1 -d' ' | paste -sd+ | bc

echo "Tidying up.."
rm ../../kernel/patch-$KERNEL_VERSION
