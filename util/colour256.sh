#for i in {0..255}; do
#  printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
#done
echo 'colour256 table'
for i in {0..255}; do 
  printf "\x1b[38;5;${i}m%-4i\x1b[0m" $i
  if ! (( ($i + 1 ) % 12 )); then
    echo
  fi
done
echo
