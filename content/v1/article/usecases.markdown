---
title: Article Use Cases | eLife API
---

# Article Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the article objects found in the fluidinfo eLife API.

## Given a DOI, get all article values

Using the `*` wildcard for `tag` in a fluidinfo query, you can get all values for an article object. The article object is located by a query on `article/doi`. In the example below, the DOI `10.7554/eLife.00013` is used.

### Request

    GET /values?query=elifesciences.org/api_v1/article/doi="10.7554/eLife.00013"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_values_by_article_doi_00013 %>