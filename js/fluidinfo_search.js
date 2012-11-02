var client;
var d;

var onSuccess = function(result) {
    // A callback to do something with the result.
    count = 0;
    objArray = Array();
    for(var tmp in result.data)
    {
      count++;
      objArray.push(result.data[tmp].id);
    }
    d.innerHTML += "\n" + count + " objects found: \n";
    for(obj in objArray)
    {
      d.innerHTML += "\n  " + objArray[obj];
    }

    d.innerHTML += "\n\n" + result.status + " " + result.statusText + "\n\n";
    d.innerHTML += JSON.stringify(result.data, null, 4);
};

var onError = function(result) {
    // A callback to do something when things go wrong.
    d.innerHTML = "error";
    d.innerHTML += "\n" + result.status + " " + result.statusText + "\n";
};

var searchNow = function()
{
    d = document.getElementById("rawData");
    d.innerHTML = "Searching...";

    var doi = document.getElementById("doi").value;
    var keyword = document.getElementById("keyword").value;
    var operator = document.getElementById("operator").value;

    var options = null;

    client = fluidinfo(options);

    var where = new Array();
    if(doi != "")
    {
      where.push('elifesciences.org/api_v1/article/doi matches "' + doi + '"');
    }
    if(keyword != "")
    {
      where.push('elifesciences.org/api_v1/article/abstract matches "' + keyword + '"');
    }

    // Flatten if only one search term
    whereQuery = "";
    if(where.length == 1)
    {
      whereQuery = where[0];
    } else {
      for (var i in where)
      {
        if(i > 0)
        {
          whereQuery += " " + operator + " ";
        }
        whereQuery += where[i];
        i++;
      }
    }
    
    if(whereQuery != "")
    {
        client.query({select: "*",
                where: whereQuery,
                onSuccess: onSuccess,
                onError: onError});
    } else {
        d.innerHTML = "No search parameters specified.";
    }
};