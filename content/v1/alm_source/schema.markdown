---
title: ALM Source Schema | eLife API
class: class="schema"
---

# ALM Source Schema

* TOC
{:toc}

## Introduction

The ALM (Article Level Metrics) Source namespace in Fluidinfo stores detail specifically about the source of ALM data, and metadata for it.

The [Schema](#schema) table contains the tags at a glance, including the following columns:

Name
: A short name for the tag in the `alm` namespace.

Tag
: A partial tag path for the tag in Fluidinfo, omitting the eLife API parent namespace. To get a full Fludinfo tag path (except for the `fluiddb/about` tag path) for version 1 of the eLife API, prepend `elifesciences.org/api_v1/` to the tag. For example, the `alm/doi` tag becomes `elifesciences.org/api_v1/alm_source/doi` tag path in Fluidinfo.

Type
: The data type stored in the tag.

List
: Some tags that may include a lists of values. Those marked with an asterisk may sometimes contain only a single value, or a list. If no asterisk, it will always be a list.

## Schema

|----------------------------+-----------------------+---------+-------|
| Name                       | Tag                   | Type    | List  |
|----------------------------|-----------------------|---------|-------+
| [about](#about)            | fluiddb/about         | string  |       |
| [name](#name)              | alm_source/name       | string  |       |
| [source](#source)          | alm_source/source     | string  |       |
| [trusted](#trusted)        | alm_source/trusted    | boolean |       |
| [url](#url)                | alm_source/url        | string  |       |


### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife ALM Source objects, the about tag includes enough detail to provide the necessary uniqueness.

#### Example

    "elife_alm_source_fake"

[Back to schema](#schema)



### name

#### Detail

Descriptive name for the ALM Source, which may be an organisation name.

#### Example

    "fake"

[Back to schema](#schema)



### source

#### Detail

A short, unique value for the source of ALM data within the eLife API. It also serves as a foreign key with objects in the alm namespace, where `alm_source/source` = `alm/alm_source`.

#### Example

    "fake"

[Back to schema](#schema)



### trusted

#### Detail

Whether the ALM Source provides data that is deemed trustworthy.

#### Example

    false

[Back to schema](#schema)



### url

#### Detail

A URL for the ALM source, where there may be more information about how the data is gathered.

#### Example

    "http://www.elifesciences.org/"

[Back to schema](#schema)



