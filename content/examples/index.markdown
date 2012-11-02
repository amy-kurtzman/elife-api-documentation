--- 
title: Example Apps
class: class="schema exampleapps"
---


# Example Apps

Below are samples and real world applications using the eLife API, compiled by eLife.

## Search using fluidinfo.js library

This basic search uses the  [fluidinfo.js](https://github.com/fluidinfo/fluidinfo.js) JavaScript client library available at GitHub. For simplicity, this example does not require a Fluidinfo account to search the eLife API. The form logic is included here at the moment: [/js/fluidinfo_search.js](/js/fluidinfo_search.js) 

**Input**

* One or two search terms, and a boolean operator. At least one search term is required. 
* The DOI field will search the `article/doi` tag. Try `00013` or another valid eLife article DOI to find a particular article.
* The keyword will search the `article/abstract` tag. Try a keyword such as `hormone`.

**Output**

* How many matching Fluidinfo objects were found,
* object ID(s),
* HTTP status code returned, and
* raw data returned via the JavaScript library.

------

<script src="/shared/js/fluidinfo.js/fluidinfo.js" type="text/javascript"></script>
<script src="/shared/js/fluidinfo/spec/fluidinfoSpec.js" type="text/javascript"></script>
<script src="/js/fluidinfo_search.js" type="text/javascript"></script>

<form action="#" onSubmit="searchNow(); return false;">

<label for="doi">DOI: 10.7554/eLife.</label><input type="text" id="doi"></input> Enter last five digits
<br>
<label for="doi">Operator:</label>
<select id="operator">
	<option value="and">and</option>
	<option value="or">or</option>
</select>
<br>
<label for="keyword">Keyword:</label><input type="text" id="keyword"></input> Full words can be matched<br>
<label for="search">&nbsp;</label><input type="submit" id="search" value=" Search "></input><br>
</form>

<pre id="rawData">Ready to search...</pre>
