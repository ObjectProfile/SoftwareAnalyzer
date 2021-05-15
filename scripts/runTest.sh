curl -L https://get.pharo.org/64/ | bash
./pharo --headless Pharo.image ./scripts/runTest.st

cat /tmp/result.txt
set RES = `grep ERROR /tmp/result.txt`

if [ -n "$RES" ]; then
		exit 1
else
		echo "ALL TEST PASSED"
		exit 0
fi
