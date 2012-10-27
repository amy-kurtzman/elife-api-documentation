---
title: Author Use Cases | eLife API
---

# Author Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the author objects found in the fluidinfo eLife API.

## Given a article DOI, get all the authors of that article

Using the `*` wildcard for `tag` in a Fluidinfo query will get all values for a author object. Each author object is found by a query on `author/article_doi`. In the example below, the DOI of the article is `10.7554/eLife.00013`.

### Request

    GET /values?query=elifesciences.org/api_v1/author/article_doi="10.7554/eLife.00013"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_author_by_article_doi_00013 %>