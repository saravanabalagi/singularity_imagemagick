for i in "2014-12-09-13-21-02" "2014-12-10-18-10-50" "2015-05-19-14-06-38"; do
  IMG_ROOT_PATH=/cephshare/compsci/public/oxford_robotcar/$i/stereo
  echo "Processing $IMG_ROOT_PATH"
  start_time=`date +%s`

  IMG_SRC_PATH="$IMG_ROOT_PATH/centre"
  SIZE="320x240"
  IMG_DEST_PATH="$IMG_ROOT_PATH/centre_$SIZE"
  mkdir $IMG_DEST_PATH

  find $IMG_SRC_PATH -name "*.png" | parallel --bar --jobs 12 mogrify -resize $SIZE -path $IMG_DEST_PATH {}
  end_time=`date +%s`
  echo "Finished processing $IMG_ROOT_PATH"
  echo Completed in `expr $end_time - $start_time`s
done
