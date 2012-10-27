---
title: Ref Schema | eLife API
class: class="schema"
---

# Ref Schema

* TOC
{:toc}

## Introduction

For each reference citied in an article, a new Fluidinfo object is created. Tag values in the `ref` namespace store individual reference details. As such, it is possible for more than one reference object to exist for the same paper, and these objects are attributed directly to the article in which they were cited.

The [Schema](#schema) table contains the tags at a glance, including the following columns:

Name
: A short name for the tag in the `ref` namespace.

Tag
: A partial tag path for the tag in Fluidinfo, omitting the eLife API parent namespace. To get a full Fludinfo tag path (except for the `fluiddb/about` tag path) for version 1 of the eLife API, prepend `elifesciences.org/api_v1/` to the tag. For example, the `ref/article_doi` tag becomes `elifesciences.org/api_v1/ref/article_doi` tag path in Fluidinfo.

Type
: The data type stored in the tag.

List
: Some tags that may include a lists of values. Those marked with an asterisk may sometimes contain only a single value, or a list. If no asterisk, it will always be a list.

## Schema

|-----------------------------------------------+-----------------------------+---------+-------|
| Name                                          | Tag                         | Type    | List  |
|-----------------------------------------------|-----------------------------|---------|-------+
| [about](#about)                               | fluiddb/about               | string  |       |
| [article_doi](#abstract)                      | ref/article_doi             | string  |       |
| [article_title](#articletitle)                | ref/article_title           | string  |       |
| [authors](#authors)                           | ref/authors                 | string  | List  |
| [collab](#collab)                             | ref/collab                  | string  |       |
| [doi](#doi)                                   | ref/doi                     | string  |       |
| [doi_url](#doiurl)                            | ref/doi_url                 | string  |       |
| [etal](#etal)                                 | ref/etal                    | boolean |       |
| [fpage](#fpage)                               | ref/fpage                   | string  |       |
| [lpage](#lpage)                               | ref/lpage                   | string  |       |
| [pmid](#pmid)                                 | ref/pmid                    | string  |       |
| [position](#position)                         | ref/position                | int     |       |
| [publication_type](#publicationtype)          | ref/publication_type        | string  |       |
| [publisher_loc](#publisherloc)                | ref/publisher_loc           | string  |       |
| [publisher_name](#publishername)              | ref/publisher_name          | string  |       |
| [ref](#ref)                                   | ref/ref                     | string  |       |
| [source](#source)                             | ref/source                  | string  |       |
| [volume](#volume)                             | ref/volume                  | string  |       |
| [year](#year)                                 | ref/year                    | string  |       |



### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife ref objects, the about tag includes the corresponding article DOI and the position in which the reference was listed.

#### Example

    "ref_2_10.7554/eLife.00013"

[Back to schema](#schema)




### article_doi

#### Detail

The article DOI for which the ref is a reference. This tag provides a method to find all reference of a particular article by DOI. `ref/article_doi` value matches `article/doi`.

#### Example

    "10.7554/eLife.00013"

[Back to schema](#schema)




### article_title

#### Detail

Article title, if the reference is an article (for other types of references, such as books, this may be absent).

#### Example

    "Chimaereicella boritolerans sp nov., a boron-tolerant and alkaliphilic bacterium of the family Flavobacteriaceae isolated from soil"

[Back to schema](#schema)




### authors

#### Detail

List of authors.

#### Example

    [
      "Ahmed I",
      "Yokota A",
      "Fujiwara T"
    ]

[Back to schema](#schema)




### collab

#### Detail

If the reference was produced as part of collaboration, the name of the collaboration is stored in this tag.

#### Example

    "Royal Society"

[Back to schema](#schema)




### doi

#### Detail

DOI of the reference, if available.

#### Example



[Back to schema](#schema)




### doi_url

#### Detail

DOI of the reference, if available, in URL compatible format.

#### Example



[Back to schema](#schema)




### etal

#### Detail

If the reference attributions include <em>et al.</em>, this will be true. The tag will be absent if not <em>et al.</em>

#### Example

    true

[Back to schema](#schema)




### fpage

#### Detail

First page of the reference citation, if present. This is sometimes not an integer, so it is stored as a string.

#### Example

    "986"

[Back to schema](#schema)




### lpage

#### Detail

Last page of the reference citation, if present. This is sometimes not an integer, so it is stored as a string.

#### Example

    "992"

[Back to schema](#schema)




### pmid

#### Detail

PubMed ID for the reference, if available.

#### Example



[Back to schema](#schema)




### position

#### Detail

Position (order) in which the author was listed in the article. Starts at 1.

#### Example

    2

[Back to schema](#schema)




### publication_type

#### Detail

Type of publication. Common values include "journal", "book", "web", "other".

#### Example

    "journal"

[Back to schema](#schema)




### publisher_loc

#### Detail

Publisher location, usually present on non-article references, such as books.

#### Example

    "New York"

[Back to schema](#schema)




### publisher_name

#### Detail

Publisher name, usually present on non-article references, such as books.

#### Example

    "Scientific American Press"

[Back to schema](#schema)




### ref

#### Detail

A full string including the raw text for the reference. Whitespace in the values will be limited, and this list is only meant to be informational. The value should be the same as the item in the article object's `article/refs` tag.

#### Example

    "Ahmed I Yokota A Fujiwara T. 2007. Chimaereicella boritolerans sp nov., a boron-tolerant and alkaliphilic bacterium of the family Flavobacteriaceae isolated from soil. Int J Syst Evol Microbiol 57: 986 \u2013 992."

[Back to schema](#schema)




### source

#### Detail

Source of the reference; for an article this will be a journal name, and for books it may be the book title.

#### Example

    "Int J Syst Evol Microbiol"

[Back to schema](#schema)




### volume

#### Detail

Volume of the journal (source) in which the reference was published. This is stored as a string, since the value is not always numeric.

#### Example

    "57"

[Back to schema](#schema)




### year

#### Detail

Year of publication for the reference. This value is not always numeric, so it is stored as a string.

#### Example

    "2007"

[Back to schema](#schema)


  