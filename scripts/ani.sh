#!/bin/bash
echo 'starting'

term=$1
cpu=$2
ani_script=$3
ls -lrth|grep $term|awk '{print $9}' > list

START=1;
END=$(cat list|wc -l);
#echo $END

for ((c = $START ; c<= $END ; c++))
        do
        a=$(head -n ${c} list|tail -n 1);
        #echo $a
        for i in *$term
                do
        $ani_script/ani.rb -1 $a -2 $i -t $cpu -T $a.vs.$i.aii.out
        done
done
