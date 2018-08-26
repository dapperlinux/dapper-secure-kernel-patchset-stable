# Reverses the patches found in this directory
# Uses patch -R to reverse
# To be called from test_patch.sh and init_rebase.sh

# ADD NEWEST FIRST

patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.123.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.122.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.121.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.120.patch
# 4.9.119 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.118.patch
# 4.9.117 does not need any omissions
# 4.9.116 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.115.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.114.patch
# 4.9.113 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.112.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.111.patch
# 4.9.110 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.109.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.108.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.107.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.106.patch
# 4.9.105 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.104.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.103.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.102.patch
# 4.9.101 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.100.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.99.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.98.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.97.patch
# 4.9.96 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.95.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.94.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.93.patch
# 4.9.92 does not need any omissions
# 4.9.91 does not need any omissions
# 4.9.90 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.89.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.88.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.87.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.86.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.85.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.84.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.83.patch
# 4.9.82 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.81.patch
# 4.9.80 does not need any omissions
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.79.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.78.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.77.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.76.patch
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.75.patch


# Contains a size_overflow bug that needs to be looked into
patch -F 0 -R -p1 < ../../omitted-patches/omit-4.9.53.patch
