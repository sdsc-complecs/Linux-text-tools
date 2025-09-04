sort unsorted1.txt
export LC_ALL=C; sort unsorted1.txt; export LC_ALL=''
sort -k3,3 unsorted2.txt
sort -k2,2 unsorted2.txt
sort -k2,2n unsorted2.txt
sort -u unsorted1.txt
sort -k3,3 -k1,1 -k2,2 unsorted3.txt
sort -k2r,2 -k1,1 -k3,3 unsorted3.txt
sort -R abc.txt
shuf abc.txt
seq 9 | shuf
