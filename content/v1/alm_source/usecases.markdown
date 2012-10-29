---
title: ALM Source Use Cases | eLife API
---

# ALM Source Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the ALM Source objects found in the Fluidinfo eLife API.

## Given a source, get all ALM source values


Using the `*` wildcard for `tag` in a fluidinfo query will get all values for an ALM Source object. The ALM Source object is located by a query on `alm_source/source`. In the example below, the source `fake` is searched.

### Request

    GET /values?query=elifesciences.org/api_v1/alm_source/source="fake"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_values_by_alm_source_source_fake %>

## Get all ALM sources

To find all ALM sources in the eLife API, a "has" query will find all objects where the `alm_source/source` tag is present. Specifying a single tag in the query will return only one tag's values.

### Request

    GET /values?query=has elifesciences.org/api_v1/alm_source/source&tag=elifesciences.org/api_v1/alm_source/source

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_source_for_all_alm_source %>

