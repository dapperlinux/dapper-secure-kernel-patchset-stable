DATE=`date +%Y-%m-%d`
KERNEL_MAJOR_VERSION=4.9
KERNEL_VERSION=4.9.135

echo "Setting up release directory..."
mkdir release
cd release

echo "Uncompressing fresh kernel..."
tar -xf ../kernel/linux-$KERNEL_MAJOR_VERSION.tar.xz

echo "Uncompressing fresh kernel subpatches..."
unxz -k ../kernel/patch-$KERNEL_VERSION.xz

cd linux-$KERNEL_MAJOR_VERSION

echo "Creating fresh git repo..."
git init

echo "Adding files to new git repo..."
git add *

echo "First commit of major kernel..."
git commit -m "baseline" >> ../../release.log

echo "Patching minor kernel version..."
patch -F 0 -p1 < ../../kernel/patch-$KERNEL_VERSION >> ../../release.log

echo "Committing minor kernel changes..."
git add *
git commit -m "update" >> ../../release.log

echo "Creating new branch..."
git checkout -b dappersec

echo "Omitting patches..."
sh ../../omitted-patches/omit-patches.sh >> ../../release.log
#git add *
#git commit -m "Omitted patches from Dapper Secure Kernel Patchset" >> ../../release.log

echo "Patching Dapper Secure Kernel Patches..."
patch -F 0 -p1 < ../../dapper-secure-kernel-patchset-test.patch >> ../../release.log

echo "Committing Dapper Secure Kernel Patches..."
git add *
git commit -m "Dapper Secure Kernel Patchset $KERNEL_VERSION" >> ../../release.log

echo "Running format-patch..."
git format-patch master

echo "Moving and renaming patch..."
cat 000* > ../../dapper-secure-kernel-patchset-$KERNEL_VERSION-$DATE.patch

echo "Tidying up.."
rm ../../kernel/patch-$KERNEL_VERSION

cd ../..

echo "Removing release directory..."
rm -rf release
