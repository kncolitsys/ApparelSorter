# Apparel Sorter

Apparel Sorter is a set of functions written in CFML that provide functionality for sorting apparel sizes such as XS, S, M, L. It can also sort numeric sizes such as 12, 14, 16W, 18W, etc.

### Suggested Use

Apparel Sorter can be helpful in e-commerce applications or with any system where apparel data needs to be displayed with the sizes listed in correct order.

### Requirements

* CFML Engine
    * Lucee 4.5 or greater
    * Railo 4.5 or greater
    * Adobe ColdFusion 11 or greater

### Usage
To simply sort an array of sizes, you can call the sortSizes() function.
```
<cfscript>
    apparelSorter = new ApparelSorter();
    sortedSizes = apparelSorter.sortSizes(["XL", "L", "S", "M", "XS"]); // returns sorted array
</cfscript>
```
You can also return the sort index. The sort index could then, for example, be stored in a database for easy sorting in SQL.
```
<cfscript>
    sizeIndex = apparelSorter.sizeIndex("XS"); // returns a number
</cfscript>
```

### Installation
Using the [CommandBox] package manager is the preferred and easiest way to install.
```
box install apparel-sorter
```
You can also download a zip of the source files and extract them into a folder of your choosing. Just be sure to create a CFML mapping so you can access the component.

### Testing
This project requires [Testbox] 2.1.0 or greater in order to run the tests included with the project.
You can run the tests by accessing [apparel_sorter_installation_folder]/tests/runner.cfm or if you are using [CommandBox] you can simply type
```
box testbox run
```

### License
Please read the License.txt file included with this distribution.

[CommandBox]: https://www.ortussolutions.com/products/commandbox
[Testbox]: http://wiki.coldbox.org/wiki/TestBox.cfm
