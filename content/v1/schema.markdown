---
title: REST API Schema | eLife API
---

# Article Schema

* TOC
{:toc}

## Introduction

Each schema page contains detail about each tag and namespace found in the eLife API. Generally, a Fluidinfo object that represents an article - for example - will have article namespace tags associated with it. Similarly, an author will have author namespace tags, etc.

A particular Fluidinfo object will not necessarily have a value for every tag. If a tag value is missing from an object, it can be assumed the value is null.

## Schema table legend

The table on each schema page list all the tags at a glance, and including the following columns:

Name
: A short name for the tag in the particular namespace.

Tag
: A partial tag path for the tag in Fluidinfo, omitting the eLife API parent namespace. To get a full Fludinfo tag path (except for the `fluiddb/about` tag path) for version 1 of the eLife API, prepend `elifesciences.org/api_v1/` to the tag. For example, the `article/abstract` tag becomes `elifesciences.org/api_v1/article/abstract` tag path in Fluidinfo.

Type
: The data type stored in the tag.

List
: Some tags that may include a lists of values. Those marked with an asterisk may sometimes contain only a single value, or a list. If no asterisk, it will always be a list.