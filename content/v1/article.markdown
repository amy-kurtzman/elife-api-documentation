---
title: Article | eLife API
---

# Articles in eLife API

* TOC
{:toc}

An article is perhaps the most important object in the eLife API; each article in the journal will have one article object in the API. Its unique key is the article DOI value, stored in the `article/doi` tag. Tags in the `article` namespace hold values that are directly linked with an article, such as the article title, date of publication, subject area categories and many others. The article schema page lists all the tags found in the `article` namespace.

As an eLife API user, below are some API calls you are likely to use. If you do not know how the Fluidinfo API works, be sure to review the general information to understand how to use these examples in practice.

## Get article objects

Each eLife article has a unique DOI. A simple way to find article objects in Fluidinfo is to query for the presence of an `article/doi` tag. The result will be a list of Fluidinfo object id values.

### Request

    GET /objects?query=has elifesciences.org/api_v1/article/doi

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_objects_by_article_doi %>

## Get article values

To get the tag values for an article object, you will specify two pieces of information: a query, and a list of tags.

You could query for all articles, and return all values of all tags, though it will return an increasingly large amount of data. It is recommended to constrain the number of article objects (by the query string) and constrain the tag values returned (by the tag list) if you only want a subset of data.

The example below finds an article by Fluidinfo object id and returns the article title. More query examples are to be found on the Use Cases page.

### Request

    GET /values?query=fluiddb/id="eb275979-d99d-4e44-a84f-15ce912ca888"&tag=elifesciences.org/api_v1/article/article_title

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_values_by_fluiddb_id %>

## Get all tag names from the article namespace

To get a list of all the tags specified in the `article` namespace directly from Fluidinfo, you can issue a GET on the namespaces endpoint. The id returned is the object for the namespace itself (of little importance in this context). 

### Request

    GET /namespaces/elifesciences.org/api_v1/article?returnTags=True

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_namespace_article %>

## Get all tags with values for a particular article object

If you have an article object id, and you want a list of all tags (in all namespaces) for the object, you can query the object itself using a GET. This may return `tagPaths` for tags outside of the eLife API namespaces, created by other Fluidinfo users.

### Request

    GET /objects/eb275979-d99d-4e44-a84f-15ce912ca888

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :FLUIDINFO_GET_OBJECTS_EB275979 %>
