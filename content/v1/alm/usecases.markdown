---
title: ALM Use Cases | eLife API
---

# ALM Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the ALM objects found in the Fluidinfo eLife API.

## Given an article DOI, get all daily ALM data

Using the `*` wildcard for `tag` in a fluidinfo query will get all values for each ALM object. The ALM objects are located by a query including the article DOI `10.7554/eLife.00013` and specifying only to return daily ALM data points by the `elifesciences.org/api_v1/alm/timespan` tag.

### Request

    GET /values?query=elifesciences.org/api_v1/alm/doi="10.7554/eLife.00013" and elifesciences.org/api_v1/alm/timespan="day"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_alm_values_by_doi_00013 %>

## Given an article DOI, source, type, and timespan, get ALM values and timestamp

As ALM data accumulates in the eLife API, it will be more efficient to constrain the objects matched and the tag values returned from a Fluidinfo query. In this example, the ALM objects must match the specified DOI, type, and source. Only the ALM value and timestamp for the value are returned by Fluidinfo in the response.

### Request

    GET /values?query=elifesciences.org/api_v1/alm/doi="10.7554/eLife.00013" and elifesciences.org/api_v1/alm/alm_source="fake"  and elifesciences.org/api_v1/alm/type="web" and elifesciences.org/api_v1/alm/timespan="day"&tag=elifesciences.org/api_v1/alm/value&tag=elifesciences.org/api_v1/alm/date_timestamp

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_alm_values_by_doi_00013_fake_web_daily %>

