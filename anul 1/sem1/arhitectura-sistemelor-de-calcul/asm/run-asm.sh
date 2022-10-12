RED='\033[0;31m'
GREEN='\033[0;32m' 
NO_COLOR='\033[0m'

printf "${GREEN}Compile:${NO_COLOR}\n"
gcc -m32 $1 -o output

printf "${RED}Output:${NO_COLOR}\n"
./output
