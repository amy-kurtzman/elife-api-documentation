---
title: Component Use Cases | eLife API
---

# Component Use Cases

* TOC
{:toc}

## Introduction

Below are sample use cases for the component objects found in the fluidinfo eLife API.

## Given a article DOI, get all the components in that article

Using the `*` wildcard for `tag` in a Fluidinfo query will get all values for a component object. Each component object is found by a query on `component/article_doi`. In the example below, the DOI of the article is `10.7554/eLife.00013`.

### Request

    GET /values?query=elifesciences.org/api_v1/component/article_doi="10.7554/eLife.00013"&tag=*

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_component_by_article_doi_00013 %>

## Given a type of component, get all component DOI in URL format

In this example, a URL for each figure stored in the eLife API is returned. Specifying `doi_url` as the `tag` in the Fluidinfo query will return DOI URL values. The query string uses a string comparison to find objects, where `component/type` = `"fig"`.

### Request

    GET /values?query=elifesciences.org/api_v1/component/type="fig"&tag=elifesciences.org/api_v1/component/doi_url

### Response

<%= headers 200,  :"Content-type" => "application/json" %>
<%= json :fluidinfo_get_component_doi_by_type_fig %>