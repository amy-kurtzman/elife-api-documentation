---
title: Component Schema | eLife API
class: class="schema"
---

# Component Schema

* TOC
{:toc}

## Introduction

A component is part of an article which is assigned its own unique component DOI.

The [Schema](#schema) table contains the tags at a glance. The Schema Overview page includes more information about each column.

## Schema

|---------------------------------+--------------------------------+---------+-------|
| Name                            | Tag                            | Type    | List  |
|---------------------------------|--------------------------------|---------|-------+
| [about](#about)                 | fluiddb/about                  | string  |       |
| [article_doi](#articledoi)      | component/article_doi          | string  |       |
| [content](#content)             | component/content              | string  |       |
| [doi](#doi)                     | component/doi                  | string  |       |
| [doi_url](#doiurl)              | component/doi_url              | string  |       |
| [position](#position)           | component/position             | int     |       |
| [type](#type)                   | component/type                 | string  |       |



### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife component objects, the about tag is the unique component DOI for the component in URL compatible format. Note: the first portion of a component DOI is the same as the article DOI, until the last '.' dot and zerofill number at the end.

#### Example

    "http://dx.doi.org/10.7554/eLife.00013.009"

[Back to schema](#schema)




### article_doi

#### Detail

The article DOI in which the component is included. This tag provides a method to find all components of a particular article by DOI. `component/article_doi` value matches `article/doi`.

#### Example

    "10.7554/eLife.00013"

[Back to schema](#schema)




### content

#### Detail

Raw text for the component.

#### Example

    "Figure supplement 1. Separation of A. machipongonensis sphingolipids by thin layer chromatography (TLC). Lipids enriched in sphingolipids were separated by TLC after visualization with ammonium molybdate in 10% H 2 SO 4 . Bands (1-12) as well as regions between bands (A-F) were tested for morphogenic activity. Region F possessed activity and was further purified. DOI:  http://dx.doi.org/elife/10.7554/eLife.00013.009"

[Back to schema](#schema)




### doi

#### Detail

DOI for the component - the component DOI itself.

#### Example

    "10.7554/eLife.00013.009"

[Back to schema](#schema)




### doi_url

#### Detail

DOI in URL compatible form.

#### Example

    "http://dx.doi.org/10.7554/eLife.00013.009"

[Back to schema](#schema)




### position

#### Detail

Position (order) in which the component was listed in the article. Starts at 1.

#### Example

    9

[Back to schema](#schema)




### type

#### Detail

Component type, extracted from the article XML. Common values include "abstract", "fig", "sub-article", "table-wrap".

#### Example

    "fig"

[Back to schema](#schema)


