 #!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "Start Times"
head -n 1 rplpl-slurm*.out rs1-slurm*.out rs2-slurm*.out rs3-slurm*.out rs4-slurm*.out

echo "End Times"
tail -n 5 rplpl-slurm*.out rs1-slurm*.out rs2-slurm*.out rs3-slurm*.out rs4-slurm*.out

m=`expr 1766 + 1985`
echo "time taken to run both jobs in series in $m seconds"

a=`expr 3751 / 3600`
b=`expr 3751 % 3600 / 60`
c=`expr 3751 - $a \* 3600 - $b \* 60`
echo "time taken to run both jobs in series in hours and mins and seconds = $a hour $b minutes $c seconds"


d=`expr 49 - 20 + 54 - 21`
e=`expr 84 - 59 + 11 - 5` 
echo "actual time taken to run both jobs in series in mins and seconds = $d minutes $e seconds "

f=`expr 1985 - 1766`
g=`expr $f / 60`
h=`expr $f - $g \* 60`
echo "time saved running the jobs in parallelization in mins and seconds = $g minutes $h seconds "

i=`expr 1985 / 8 \* 110` 
j=`expr $i / 3600`
k=`expr $i % 3600 / 60`
l=`expr 27294 - $j \* 3600 - $k \* 60`
echo "time taken to process 110 channels in series in hours and mins and seconds = $j hours $k minutes $l seconds "
