component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		apparelSorter = new ApparelSorter();
	}

	function run() {
		describe("sortSizes() functionality", function() {

			it("should sort standard abbreviated sizes", function() {
				var sizes = ["XL", "L", "S", "M", "XS","3XL","1XL","2XL"];
				expect(apparelSorter.sortSizes(sizes)).toBe(["XS","S","M","L","XL","1XL","2XL","3XL"]);
			});

			it("should sort XXL as if it were 2XL", function() {
				var sizes = ["3XL","1XL","XXL"];
				expect(apparelSorter.sortSizes(sizes)).toBe(["1XL", "XXL", "3XL"]);
				var sizes = ["3XL","1XL","2XL"];
				expect(apparelSorter.sortSizes(sizes)).toBe(["1XL", "2XL", "3XL"]);
			});

			it("should sort extended sizes", function() {
				var sizes = ["6X","5X","9XL","3XL", "2X","1X","18X","13X"];
				expect(apparelSorter.sortSizes(sizes)).toBe(["1X","2X","3XL","5X","6X","9XL","13X","18X"]);
			});

			it("should sort size ranges with forward slashes such as X/S, S/M, etc.", function() {
				var sizes = ["L/XL","XS/S","S/M"];
				expect(apparelSorter.sortSizes(sizes)).toBe(["XS/S","S/M","L/XL"]);
			});

			it("should sort numeric sizes", function() {
				var sizes = ["18", "16", "14", "12", "10", "8", "6", "4", "2", "0"];
				expect(apparelSorter.sortSizes(sizes)).toBe(["0","2","4","6","8","10","12","14","16","18"]);
			});

		});

		describe("sizeIndex() functionality", function() {

			it("should return a numeric value for various sizes", function() {
				expect(isNumeric(apparelSorter.sizeIndex("XS"))).toBeTrue();
				expect(isNumeric(apparelSorter.sizeIndex("Small"))).toBeTrue();
				expect(isNumeric(apparelSorter.sizeIndex("Large"))).toBeTrue();
			});

		});
	}



}