<div align="center">
<a href="https://github.com/rdedo099/Portfolio/tree/main/QA%20Jacoco%20Code%20Coverage%20and%20Refactoring">
</a>
<h2>Object Oriented Python Canvas</h3>
<h4>Object Oriented Python Canvas - Implementation of a Rectangle on a Canvas</h4>
</div>
<div>
<p>
<br/>

*NOTE* Not all code present is original, and was provided to run code coverage tests. Further tests were added to the original code to increase the coverage. Tests were only added to date/test/DateTest.java. After which the code in date/src/Date.java was refactored in efforts to clean it up.

Steps to run code coverage with jacoco

Step 1: 
open file directory into cmd

Step 2: 
javac -encoding UTF-8 --source-path test -d dist -cp lib/junit-platform-console-standalone-1.7.1.jar test/*.java src/*.java

Step 3:
javac -encoding UTF-8 --source-path test -d dist -cp dist:lib/junit-platform-console-standalone-1.7.1.jar test/*.java

Step 4:
java -javaagent:lib/jacocoagent.jar -jar lib/junit-platform-console-standalone-1.7.1.jar --class-path dist --scan-class-path

Step 5:
java -jar lib/jacococli.jar report jacoco.exec --classfiles dist --sourcefiles src --html report

From here a report will be generated within the report directory, you can view it within a browser, the desired file is titled index.html

With the code complete code coverage is not fully feasible/possible as you need to test every line of code in essence. In cases with code that has high cyclomatic complexity, there are far too many variable to cover ever combination. The same goes with this case, where the year can be any number including and above 0, therefore an unlimited number of possibilities and combinations, thus an infinite amount of possible test cases.

As well, after performing the code cleaning, the missed instructions percentage remained the same, however, the total number of instructions reducedby 29 total instructions. In conjuction with this, the missed branches percentage decreased by 3%, as now 10 of the 68 branches were missed after performing the code cleaning. No new lines of code are being covered by the tests, but instead fewer branches are being covered, thus the degrade of branch coverage.