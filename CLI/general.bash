ls # list files
cat # read file and writes into output
| # pipe command, wait for first command to finish then run second

# loop
for n in {1..5}; 
do
    echo $n
done

# output
SomeCommand > SomeFile.txt # stdout
SomeCommand >> SomeFile.txt # append
SomeCommand &> SomeFile.txt # stderr
SomeCommand &>> SomeFile.txt # append
SomeCommand 2>&1 | tee SomeFile.txt # both

# check ports
netstat -ano

####
#### security
####

# Secure Hash Algorithm (SHA) is a set of cryptographic hash functions designed by U.S. National Security Agency (NSA) published in 2001.
# SHA-256 standard is used in document integrity checks.
echo -n str | sha256sum # compute hash for a string
