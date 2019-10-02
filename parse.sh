echo `pwd`
#test_list
DATA_SET=/home/workspace/UCF101/UCF-101
flag='invalid'

cat test_list | while read line
do
    values=(${line})
    #mkdir
    if [ ! -d ${values[0]} ]; then
        mkdir -p ${values[0]}
        #echo 'mkdir'
    fi
    #file
    path=(${values[0]})
    split=(`echo ${values[0]} | tr '/' ' '`)

    file="${DATA_SET}/${split[1]}/${split[2]}.avi"
    if [ $flag == $file ]; then
        continue
    fi

    ffmpeg -i $file ${values[0]}/%6d.jpg &> log
    echo "ffmpeg $file"
    flag=$file
done
