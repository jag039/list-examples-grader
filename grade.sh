CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -e ListExamples.java ]]
then
    echo "correct file submitted"
else 
    echo "incorrect file subitted"
    exit
fi 

javac ListExamples.java
if [[ $? -eq 0 ]]
then
    echo "compliation success"
else   
    echo "compilation error"
fi

cp ../TestListExamples.java ./
mkdir lib
cp ../lib/hamcrest-core-1.3.jar lib/
cp ../lib/junit-4.13.2.jar lib/

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > out.txt
if [[ $? -eq 0 ]]
then
    echo "JUNIT TESTS compiled successfully"
else   
    echo "JUNIT TESTS FAILED to compile"
fi

grep  'Tests run: ' out.txt > results.txt
cat results.txt




