component {

	regexes = [
		"0",
		"osfa.*$",
		"one .*$",
		"one$",
		"xxs",
		"xs .*$",
		"x sm.*$",
		"xs.*$",
		".* xs$",
		"xs",
		"sm.*$",
		".* small",
		"^s$",
		"small.*$",
		"s/.*$",
		"s /.*$",
		"s .*$",
		"^m$",
		"^medium.*$",
		".*med.*$",
		"^m .*$",
		"m[A-Za-z]*",
		"M/.*$",
		"^l$",
		".*lg.*$",
		"large.*$",
		"l .*$",
		"l/.*$",
		"lt$",
		"^xl.*$",
		"^x large.*$",
		".* XL$",
		"^x-l.*$",
		"^l[A-Za-z]*$",
		"petite l.*$",
		"^1x.*$",
		".* 1x$",
		"^2x.*$",
		".* 2X$",
		".*XXL.*$",
		"^3x.*$",
		"^4x.*$",
		"^5x.*$",
		"^6x.*$",
		"^7x.*$",
		"^8x.*$",
		"^9x.*$",
		"^10x.*$",
		"^11x.*$",
		"^12x.*$",
		"^13x.*$",
		"^14x.*$",
		"^15x.*$",
		"^16x.*$",
		"^17x.*$",
		"^18x.*$",
		".*$"
	].map(function(regex, index) {
		return {regex: regex, index: index};
	});

	public array function sortSizes(required array sizes) {
		return sizes
			.map(matchSizesWithRegexes)
			.sort(sortSizesByIndex)
			.map(getSize);
	}

	public numeric function sizeIndex(required string size) {
		return [size]
			.map(matchSizesWithRegexes)
			.map(getIndex)[1];
	}

	///////////////////////////////////////////////////////////////////////////

	private struct function matchSizesWithRegexes(required string size, required numeric index) {
		return findRegexMatch(patterns=regexes, iteration=1, size=size);
	}

	private function findRegexMatch(required array patterns, required numeric iteration, required string size) {
		if (reFindNoCase(patterns[iteration].regex, size)) {
			return {regex: patterns[iteration].regex, index: patterns[iteration].index, size: size, sizeVal: val(size)};
		}
		return findRegexMatch(patterns=patterns, iteration=iteration + 1, size=size);
	}

	private numeric function sortSizesByIndex(required any size1, required any size2) {
		if (size1.index < size2.index || size1.sizeVal > 0 && size2.sizeVal > 0 && size1.sizeVal < size2.sizeVal) return -1;
		if (size1.index == size2.index || size1.sizeVal > 0 && size2.sizeVal > 0 && size1.sizeVal == size2.sizeVal) return 0;
		return 1;
	}

	private string function getSize(required struct result) {
		return result.size;
	}

	private string function getIndex(required struct result) {
		return result.index;
	}

}