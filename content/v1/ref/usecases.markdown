---
title: Ref Use Cases | eLife API
---

# Ref Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the ref objects found in the fluidinfo eLife API.

## Given a DOI, get all references cited

Using the `*` wildcard for `tag` in a fluidinfo query will get all values for a ref object. Each ref object is found by a query on `ref/article_doi`. In the example below, the DOI of the article is `10.7554/eLife.00013`.

### Request

    GET /values?query=elifesciences.org/api_v1/ref/article_doi="10.7554/eLife.00013"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_ref_by_article_doi_00013 %>


