# Dapper Secure Kernel Patchset Stable

## Introduction
The Dapper Secure Kernel Patchset is an effort to forward port the now discontinued Grsecurity test patchset to newer Linux kernels. While it may not contain the latest and greatest security advancements as provided by the subscriber only Grsecurity beta patchset, the features provided by the final Grsecurity 4.9.24 patch are well worth maintaining into the future.

## Currently Released Patch:
| Linux Version | Dapper Secure Kernel Patch | Status                |
| ------------- | -------------------------- | --------------------- |
| 4.9.39        | 4.9.39-2017-08-04          | Fully working.        |

## Features

## Status and Current Issues

### Project Status
| Task                                             | Status    |
| -------------------------------------------------| --------- |
| Resolve Merge Conflicts to Linux 4.9             | Completed |
| Resolve Merge Conflicts to Minor Release (4.9.39)| Completed |
| Resolve Merge Conflicts with Patch Fuzz Disabled | Completed |
| Fix Compiler Errors and Resolve Merge Mistakes   | Completed |
| Run and Test Kernel, Ensuring PaX Test Passes    | Completed |

### Known Issues
None yet! If you find something not working, please create an [issue](https://github.com/dapperlinux/dapper-secure-kernel-patchset-stable/issues/new).

### FAQ
**Is this kernel ready for production?**
Look at the status above, and even if everything has been completed, proceed with caution. While we do our best to ensure everything is working, things do and can go wrong, so it might not be a good idea to test on your primary system without having a backup.

**Does this patchset provide the same level of security as the Grsecurity patchset?**
Yes and No. This patchset provides a snapshot of the features from the last public grsecurity release as of Linux 4.9.24, and those features are forward ported to newer kernels. They will likely provide a much enhanced level of security over the stock kernel, but will not match the advancements made by Open Source Security Inc on the Grsecurity patchset.

**I'm in some sort of physical danger from active adversaries, or I need absolute reliability. Is this patchset for me?**
No, Dapper Secure Kernel Patchset is not built for these sorts of threat models. I highly suggest purchasing a subscription for the Grsecurity patchset from Open Source Security Inc, as they will take care of your needs in a professional manner. 

**I would like some support with using this patchset. Who can I talk to about support plans?**
You can email me at [matthew.ruffell@dapperlinux.com](mailto:matthew.ruffell@dapperlinux.com) 



## How to Contribute

### Initialise A Stock Kernel Repo For Rebasing
Patches are created by modifying the stock kernel code, and then outputting a patch in the form of "hunks" that show the differences between the modifications made and stock kernel. So, a git repository needs to be set up that we will be doing all of our modifications to. 
By running ```$ ./init_rebase.sh``` a directory called ```rebase``` is created, and inside that the current kernel is uncompressed, and a git repository is initialised, and a commit is made of the stock kernel. Any minor releases are also patched ontop and committed.

### Build A Test Patch
Patch code for the Dapper Secure Kernel Patchset is stored in ```patches```, and are named with the splitdiff naming convention from when the patches were split into file based hunks from the original grsecurity patch. If you want to modify the file ```/mm/memory.c``` for example, it would be found by searching for ```a_mm_memory.c``` in the ```patches``` directory. 
To generate a test patch, run the script ```./create_test.sh``` which will create a new file, ```dapper-secure-kernel-patchset-test.patch```, which contains all patches present in the ```patches``` directory.

### Test the Test Patch
To apply this test and see if there are any merge conflicts present with the current kernel release, you can run the script ```./test_patch.sh```. This script will uncompress a fresh Linux kernel into a new directory called ```test/linux-4.11``` and apply any minor kernel patches before applying the ```dapper-secure-kernel-patchset-test.patch``` file. Output is logged to the file ```test.log``` and any merge conflicts are saved to files of the format ```FILENAME.rej``` in the ```test/linux-4.11``` tree.

### Find Merge Conflicts
If you look at the console after running ```./test_patch.sh```, you will see output which lists the files which have merge conflicts, how many hunks have failed and where the rejected hunks are stored. A count is also provided showing how many files have failed. Navigate into the ```test/linux-4.11``` tree and locate your rejection.

### Resolve Problems and Modify Patch
Now, open the rejection in your favourite text editor, and open a clean file from the ```rebase``` directory that matches the rejection.
Manually apply the rejections to the fresh file from ```rebase``` and save the file. Note, if you cannot find the rejections in the fresh file, they may have been moved or deleted, in which case you will have to look at Linus's git tree and find the commit where that file was modified and take further action depending on if it was moved or deleted.
Now, you would have saved your modifications, so go ahead and navigate to the ```rebase/linux-4.11``` directory and run ```git diff``` to ensure your changes are listed and you have no whitespace problems. If everything is okay, run ```git diff > ../../tmp.patch``` to save the diff to a temporary file. Open that file up, along with the original patch from the ```patches``` directory, and move the changed hunks into the patch file, taking care not to remove any of the other hunks. Once you are done, reset the ```rebase``` directory back to being fresh with ```git reset --hard```

### Recreate and Retest Test Patch
Now you can run ```./create_test.sh``` to generate a new patch, and then ```./test_patch.sh``` to see if your merge conflicts for that file have been resolved.

### Make A Release Patch
Once you are happy with your changes, you can make a real patch for compiling / distribution by running the scripts ```./create_test.sh``` and then ```./make_release.sh``` which will create a temporary folder ```release```, create a git repository and uncompress a fresh kernel and its patches, and commit them. It will then patch the repository with ```dapper-secure-kernel-patchset-test.patch``` and then it will do a git format-patch. The output will be placed in the top level as something like ```dapper-secure-kernel-patchset-4.11.1-2017-05-20.patch``` where the real date is used.

### Compile The Kernel
You can then use the release patch to compile a kernel. I highly recommend compiling using whatever package setup you have going for your distribution, just add it as a patch to be applied during the build process. If you want an explicit target, check out [dapper-secure-kernel](https://github.com/dapperlinux/dapper-kernel-grsec) and use that package on Dapper Linux or any RPM based distro.
