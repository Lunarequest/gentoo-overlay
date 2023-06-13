# Luna's gentoo overlay

This is my personal gentoo overlay and this carries a handful of packages including uutils-coreutils which is a patched version that replaces coreutils with uutils-coreutils. you need to add `sys-apps/coreutils` in `/etc/portage/package.provided`. you also need to follow this bootstrap system

# bootstrap uutils, with ... uutils?

so you can build uutils without any coreutils, just cargo. you **must** build it as a multicall binary so add `MULTICALL=y` to you make command. so in a quick gist, git clone/download as a tarball the uutils repo. Next build it. 

at this point you have all the utils as one binary. run `./target/release/coreutils cp ./target/release/coreutils /usr/bin/coreutils`. now run `install.py` you can manually do what install.py does(create all the symlinks to have a working coreutils install and creates a line to add to your make.conf that then allows you to install coreutils via portage). At this point you can build coreutils via portage and install it!

in a nutshell you can bootstrap uutils, with uutils!