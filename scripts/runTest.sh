curl -L https://get.pharo.org/64/ | bash
./pharo --headless Pharo.image ./scripts/runTest.st

FILE=/tmp/result.txt
if [ ! -f "$FILE" ]; then
    echo "\x1b[31mERROR:\x1b[0m $FILE does not exists!"
    exit 1
fi


cat $FILE
set RES = `grep ERROR $FILE`

if [ -n "$RES" ]; then
		exit 1
else
		echo "\x1b[32mALL TEST PASSED"
		exit 0
fi
