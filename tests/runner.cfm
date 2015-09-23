<cfscript>
	param name="url.reporter" default="simple";
	tests = ["tests.ApparelSorterTest"]; // Array of tests to run

	runner = new testbox.system.TestBox(tests);

	// Run our test suites
	results = runner.run(reporter=url.reporter);

	// Output the results
	writeOutput(results);
</cfscript>