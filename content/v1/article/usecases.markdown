---
title: Article Use Cases | eLife API
---

# Article Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the article objects found in the Fluidinfo eLife API.

## Given a DOI, get all article values

Using the `*` wildcard for `tag` in a Fluidinfo query will get all values for an article object. The article object is located by a query on `article/doi`. In the example below, the DOI `10.7554/eLife.00013` is used.

### Request

    GET /values?query=elifesciences.org/api_v1/article/doi="10.7554/eLife.00013"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_values_by_article_doi_00013 %>

## Given a month, get all articles published that month

In this example, instead of a `*` wildcard for `tag`, it will only get the article DOI. To filter objects by date of publication, and specifically for the month of October 2012, the query string will search by `article/pub_date_month` = 10 and `article/pub_date_year` = 2012. Numeric value matching is possible on these tags, since the data stored is integer type.

### Request

    GET /values?query=elifesciences.org/api_v1/article/pub_date_month=10 and elifesciences.org/api_v1/article/pub_date_year=2012&tag=elifesciences.org/api_v1/article/doi

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_article_doi_by_month_october_2012 %>

## Given a subject area, get all articles in that subject area

This example uses the "contains" operator in the Fluidinfo query to case sensitive match a list value. In this case, it is matching "Cell biology" in an `article/subject_area` list.

### Request

    GET /values?query=elifesciences.org/api_v1/article/subject_area contains "Cell biology"&tag=elifesciences.org/api_v1/article/doi

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_article_doi_by_subject_area_cell_biology %>

## Given a keyword, search articles with matching title or abstract

This example uses the "matches" operator in the Fluidinfo query to case insensitive match full words. In this case, the keyword can match in the `article/article_title` or the `article/abstract`.

### Request

    GET /values?query=elifesciences.org/api_v1/article/article_title matches "hormone" or elifesciences.org/api_v1/article/abstract matches "hormone"&tag=elifesciences.org/api_v1/article/doi

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_article_doi_by_keyword_hormone %>

