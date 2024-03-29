import os
progs = ['[', "arch", "b2sum", "b3sum", "base32", "base64", "basename", "basenc", "cat", "chgrp", "chmod", "chown", "chroot",
    "cksum", "comm", "cp", "csplit", "cut", "date", "dd", "df", "dir", "dircolors", "dirname", "du", "echo", "env", "expand",
    "expr", "factor", "false", "fmt", "fold", "groups", "hashsum", "head", "hostid", "hostname", "id", "install", "join",
    "kill", "link", "ln", "logname", "ls", "md5sum", "mkdir", "mkfifo", "mknod", "mktemp", "more", "mv", "nice", "nl",
    "nohup", "nproc", "numfmt", "od", "paste", "pathchk", "pinky", "pr", "printenv", "printf", "ptx", "pwd", "readlink",
    "realpath", "relpath", "rm", "rmdir", "seq", "sha1sum", "sha224sum", "sha256sum", "sha3-224sum", "sha3-256sum",
    "sha3-384sum", "sha3-512sum", "sha384sum", "sha3sum", "sha512sum", "shake128sum", "shake256sum", "shred",
    "shuf", "sleep", "sort", "split", "stat", "stdbuf", "sum", "sync", "tac", "tail", "tee", "test", "timeout", "touch",
    "tr", "true", "truncate", "tsort", "tty", "uname", "unexpand", "uniq", "unlink", "uptime", "users", "vdir", "wc", "who",
    "whoami", "yes"
    ]

coreutils = "/usr/bin/coreutils"

for prog in progs:
    if os.path.exists(f"/usr/bin/{prog}"):
        print(f"{prog} is already installed deleting")
        os.system(f"rm -rf /usr/bin/{prog}")
    print(f"symlinking {prog}")
    os.system(f"/usr/bin/coreutils ln /usr/bin/coreutils /usr/bin/{prog}")

out = ""
for prog in progs:
    line = f"/usr/bin/{prog} "
    out+=line
out+="/usr/bin/coreutils usr/share/bash-completion/completions/more /usr/share/man/man1/*.bz2"
print(f"COLLISION_IGNORE=\"{out}\"")
