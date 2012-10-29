---
title: Article Schema | eLife API
class: class="schema"
---

# Article Schema

* TOC
{:toc}

## Introduction

This page contains detail about each tag found in the `article` namespace of the eLife API. An article object in Fluidinfo will have values for these tags, and most values derived from the article's XML. A particular article object will not necessarily have a value for every tag; if a tag's value is not present, it can be assumed to be null for that object.

The [Schema](#schema) table contains the tags at a glance, including the following columns:

Name
: A short name for the tag in the `article` namespace.

Tag
: A partial tag path for the tag in Fluidinfo, omitting the eLife API parent namespace. To get a full Fludinfo tag path (except for the `fluiddb/about` tag path) for version 1 of the eLife API, prepend `elifesciences.org/api_v1/` to the tag. For example, the `article/abstract` tag becomes `elifesciences.org/api_v1/article/abstract` tag path in Fluidinfo.

Type
: The data type stored in the tag.

List
: Some tags that may include a lists of values. Those marked with an asterisk may sometimes contain only a single value, or a list. If no asterisk, it will always be a list.

## Schema

|------------------------------------------------------------------------------+-------------------------------------------------+---------+-------|
| Name                                                                         | Tag                                             | Type    | List  |
|------------------------------------------------------------------------------|-------------------------------------------------|---------|-------+
| [about](#about)                                                              | fluiddb/about                                   | string  |       |
| [abstract](#abstract)                                                        | article/abstract                                | string  |       |
| [accepted_date_date](#accepteddatedate)                                      | article/accepted_date_date                      | string  |       |
| [accepted_date_day](#accepteddateday)                                        | article/accepted_date_day                       | int     |       |
| [accepted_date_month](#accepteddatemonth)                                    | article/accepted_date_month                     | int     |       |
| [accepted_date_timestamp](#accepteddatetimestamp)                            | article/accepted_date_timestamp                 | int     |       |
| [accepted_date_year](#accepteddateyear)                                      | article/accepted_date_year                      | int     |       |
| [ack](#ack)                                                                  | article/ack                                     | string  |       |
| [article_country](#articlecountry)                                           | article/article_country                         | string  |       |
| [article_institution](#articleinstitution)                                   | article/article_institution                     | string  |       |
| [article_title](#articletitle)                                               | article/article_title                           | string  |       |
| [article_type](#articletype)                                                 | article/article_type                            | string  |       |
| [author_notes](#authornotes)                                                 | article/author_notes                            | string  | List* |
| [authors](#authors)                                                          | article/authors                                 | string  | List  |
| [award_group_award_id](#awardgroupawardid)                                   | article/award_group_award_id                    | string  | List* |
| [award_group_funding_source](#awardgroupfundingsource)                       | article/award_group_funding_source              | string  | List* |
| [award_group_principle_award_recipient](#awardgroupprincipleawardrecipient)  | article/award_group_principle_award_recipient   | string  | List* |
| [components](#components)                                                    | article/components                              | string  | List  |
| [conflict](#conflict)                                                        | article/conflict                                | string  |       |
| [copyright_holder](#copyrightholder)                                         | article/copyright_holder                        | string  |       |
| [copyright_statement](#copyrightstatement)                                   | article/copyright_statement                     | string  |       |
| [copyright_year](#copyrightyear)                                             | article/copyright_year                          | string  |       |
| [correspondence](#correspondence)                                            | article/correspondence                          | string  |       |
| [doi](#doi)                                                                  | article/doi                                     | string  |       |
| [doi_url](#doiurl)                                                           | article/doi_url                                 | string  |       |
| [funding_statement](#fundingstatement)                                       | article/funding_statement                       | string  |       |
| [journal_id](#journalid)                                                     | article/journal_id                              | string  |       |
| [journal_issn_epub](#journalissnepub)                                        | article/journal_issn_epub                       | string  |       |
| [journal_issn_ppub](#journalissnppub)                                        | article/journal_issn_ppub                       | string  |       |
| [journal_title](#journaltitle)                                               | article/journal_title                           | string  |       |
| [keywords](#keywords)                                                        | article/keywords                                | string  | List* |
| [license](#license)                                                          | article/license                                 | string  |       |
| [license_type](#licensetype)                                                 | article/license_type                            | string  |       |
| [license_url](#licenseurl)                                                   | article/license_url                             | string  |       |
| [pmid](#pmid)                                                                | article/pmid                                    | string  |       |
| [pub_date_date](#pubdatedate)                                                | article/pub_date_date                           | string  |       |
| [pub_date_day](#pubdateday)                                                  | article/pub_date_day                            | int     |       |
| [pub_date_month](#pubdatemonth)                                              | article/pub_date_month                          | int     |       |
| [pub_date_timestamp](#pubdatetimestamp)                                      | article/pub_date_timestamp                      | int     |       |
| [pub_date_year](#pubdateyear)                                                | article/pub_date_year                           | int     |       |
| [publisher](#publisher)                                                      | article/publisher                               | string  |       |
| [received_date_date](#receiveddatedate)                                      | article/received_date_date                      | string  |       |
| [received_date_day](#receiveddateday)                                        | article/received_date_day                       | int     |       |
| [received_date_month](#receiveddatemonth)                                    | article/received_date_month                     | int     |       |
| [received_date_timestamp](#receiveddatetimestamp)                            | article/received_date_timestamp                 | int     |       |
| [received_date_year](#receiveddateyear)                                      | article/received_date_year                      | int     |       |
| [refs](#refs)                                                                | article/refs                                    | string  | List  |
| [research_organism](#researchorganism)                                       | article/research_organism                       | string  | List* |
| [subject_area](#subjectarea)                                                 | article/subject_area                            | string  | List* |

\* Lists are only used when two or more values are present in the article


### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife article objects, the about tag is the article DOI in its URL compatible format.

#### Example

    "http://dx.doi.org/10.7554/eLife.00013"

[Back to schema](#schema)


### accepted_date_date

#### Detail

Human readable date for when the article was accepted.

#### Example

    "July 18, 2012"

[Back to schema](#schema)


### accepted_date_day

#### Detail

Day of the month when the article was accepted.

#### Example

    18

[Back to schema](#schema)


### accepted_date_month

#### Detail

Numeric value for the month when the article was accepted.

#### Example

    7

[Back to schema](#schema)


### accepted_date_timestamp

#### Detail

Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT) when the article was accepted, in UTC timezone.

#### Example

    1342569600

[Back to schema](#schema)


### accepted_date_year

#### Detail

Year when the article was accepted, 4 digit format.

#### Example

    2012

[Back to schema](#schema)


### ack

#### Detail

Acknowledgements.

#### Example

    "AcknowledgementsWe thank Michael Fischbach, Richard Losick, and Russell Vance for critical reading of the manuscript. NK is a Fellow in the Integrated Microbial Biodiversity Program of the Canadian Institute for Advanced Research."

[Back to schema](#schema)


### article_country

#### Detail

Country for the article as a whole, if present. If not present, each author's country may provide more detail.

#### Example



[Back to schema](#schema)


### article_institution

#### Detail

Institution for the article as a whole, if present. If not present, each author's institution may provide more detail.

#### Example



[Back to schema](#schema)


### article_title

#### Detail

Title of the article.

#### Example

    "A bacterial sulfonolipid triggers multicellular development in the closest living relatives of animals"

[Back to schema](#schema)


### article_type

#### Detail

Type of article. Values may include "research-article", "editorial", "article-commentary".

#### Example

    "research-article"

[Back to schema](#schema)


### author_notes

#### Detail

Author notes for the article as whole. Individual author objects may contain more detail about notes pertaining to a particular author.

#### Example

    "†These authors contributed equally to this work."

[Back to schema](#schema)


### authors

#### Detail

A list of authors by name, in the order listed in the article XML. More detail about each author is stored in the `author` namespace.

#### Example

    [
      "Rosanna A Alegado",
      "Laura W Brown",
      "Shugeng Cao",
      "Renee K Dermenjian",
      "Richard Zuzow",
      "Stephen R Fairclough",
      "Jon Clardy",
      "Nicole King"
    ]

[Back to schema](#schema)


### award_group_award_id

#### Detail

Funding information directly attributed to the research in the article. Funding by individual authors can be found in the `author` namespace.

#### Example

    "F32 GM086054"

[Back to schema](#schema)


### award_group_funding_source

#### Detail

Funding information directly attributed to the research in the article. Funding by individual authors can be found in the `author` namespace.

#### Example

    "Gordon and Betty Moore Foundation Marine Microbiology Initiative"

[Back to schema](#schema)


### award_group_principle_award_recipient

#### Detail

Principle person awarded funding directly attributed to the research in the article. Funding by individual authors can be found in the `author` namespace.

#### Example

    "Nicole King"

[Back to schema](#schema)


### components

#### Detail

Components of the article which have individual component DOI values. In the `article` namespace, the value is a list of component DOI in URL compatible format. More detail about each component is stored in the `component` namespace.

#### Example

    [
      "http://dx.doi.org/10.7554/eLife.00013.001",
      "http://dx.doi.org/10.7554/eLife.00013.002",
      "http://dx.doi.org/10.7554/eLife.00013.003",
      "http://dx.doi.org/10.7554/eLife.00013.004",
      "http://dx.doi.org/10.7554/eLife.00013.005",
      "http://dx.doi.org/10.7554/eLife.00013.006",
      "http://dx.doi.org/10.7554/eLife.00013.007",
      "http://dx.doi.org/10.7554/eLife.00013.008",
      "http://dx.doi.org/10.7554/eLife.00013.009",
      "http://dx.doi.org/10.7554/eLife.00013.010",
      "http://dx.doi.org/10.7554/eLife.00013.011",
      "http://dx.doi.org/10.7554/eLife.00013.012",
      "http://dx.doi.org/10.7554/eLife.00013.013",
      "http://dx.doi.org/10.7554/eLife.00013.014",
      "http://dx.doi.org/10.7554/eLife.00013.015",
      "http://dx.doi.org/10.7554/eLife.00013.016",
      "http://dx.doi.org/10.7554/eLife.00013.017",
      "http://dx.doi.org/10.7554/eLife.00013.018",
      "http://dx.doi.org/10.7554/eLife.00013.019",
      "http://dx.doi.org/10.7554/eLife.00013.020",
      "http://dx.doi.org/10.7554/eLife.00013.021",
      "http://dx.doi.org/10.7554/eLife.00013.022",
      "http://dx.doi.org/10.7554/eLife.00013.023",
      "http://dx.doi.org/10.7554/eLife.00013.024",
      "http://dx.doi.org/10.7554/eLife.00013.025",
      "http://dx.doi.org/10.7554/eLife.00013.026",
      "http://dx.doi.org/10.7554/eLife.00013.027",
      "http://dx.doi.org/10.7554/eLife.00013.028",
      "http://dx.doi.org/10.7554/eLife.00013.029",
      "http://dx.doi.org/10.7554/eLife.00013.030"
    ]

[Back to schema](#schema)


### conflict

#### Detail

Conflicts of interest specifically mentioned in the article.

#### Example

    "The remaining authors have no competing interests to declare."

[Back to schema](#schema)


### copyright_holder

#### Detail

Copyright holder.

#### Example

    "Alegado et al"

[Back to schema](#schema)


### copyright_statement

#### Detail

Copyright statement.

#### Example

    "Copyright © 2012, Alegado et al"

[Back to schema](#schema)


### copyright_year

#### Detail

Copyright year.

#### Example

    2012

[Back to schema](#schema)


### correspondence

#### Detail

Where to direct correspondence, as specified in the article.

#### Example

    "*For correspondence: jon_clardy@hms.harvard.edu (JC); nking@berkeley.edu (NK)"

[Back to schema](#schema)


### doi

#### Detail

DOI (Digital Object Identifier) unique identifier for the article. An article's DOI is also used for its `fluiddb/about` tag value. This value is used as a foreign key for related objects in the `author`, `component`, and `ref` namespaces.

#### Example

    "10.7554/eLife.00013"

[Back to schema](#schema)


### doi_url

#### Detail

DOI (Digital Object Identifier) unique identifier for the article, in URL compatible format.  An article's DOI URL is also used for its `fluiddb/about` tag value.

#### Example

    "http://dx.doi.org/10.7554/eLife.00013"

[Back to schema](#schema)


### funding_statement

#### Detail

Funding statement as specified in the article.

#### Example

    "The funders had no role in study design, data collection and interpretation, or the decision to submit the work for publication."

[Back to schema](#schema)


### journal_id

#### Detail

Short idenitifier for the journal in which the article was published.

#### Example

    "elife"

[Back to schema](#schema)


### journal_issn_epub

#### Detail

Electronic ISSN assigned to the journal.

#### Example

    "2050-084X"

[Back to schema](#schema)


### journal_issn_ppub

#### Detail

Print ISSN for the journal, if present.

#### Example



[Back to schema](#schema)


### journal_title

#### Detail

Full name of the journal.

#### Example

    "eLife"

[Back to schema](#schema)


### keywords

#### Detail

Keywords specified for the article.

#### Example

    [
      "Salpingoeca rosetta",
      "Algoriphagus",
      "bacterial sulfonolipid",
      "multicellular development"
    ]

[Back to schema](#schema)


### license

#### Detail

Verbose licensing text for the particular article.

#### Example

    "This article is distributed under the terms of the Creative Commons Attribution License, which permits unrestricted use and redistribution provided that the original author and source are credited."

[Back to schema](#schema)


### license_type

#### Detail

The type of licensing for the article content.

#### Example

    "open-access"

[Back to schema](#schema)


### license_url

#### Detail

URL of the license to the article content. 

#### Example

    "http://creativecommons.org/licenses/by/3.0/"

[Back to schema](#schema)


### pmid

#### Detail

PubMed ID of the article, if available.

#### Example



[Back to schema](#schema)


### pub_date_date

#### Detail

Human readable date for when the article was published.

#### Example

    "October 15, 2012"

[Back to schema](#schema)


### pub_date_day

#### Detail

Day of the month when the article was published.

#### Example

    15

[Back to schema](#schema)


### pub_date_month

#### Detail

Numeric value for the month when the article was published.

#### Example

    10

[Back to schema](#schema)


### pub_date_timestamp

#### Detail

Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT) when the article was published, in UTC timezone.

#### Example

    1350259200

[Back to schema](#schema)


### pub_date_year

#### Detail

Year when the article was published, 4 digit format.

#### Example

    2012

[Back to schema](#schema)


### publisher

#### Detail

Legal company or organisation name for the publisher.

#### Example

    "eLife Sciences Publications, Ltd"

[Back to schema](#schema)


### received_date_date

#### Detail

Human readable date for when the article was received.

#### Example

    "May 22, 2012"

[Back to schema](#schema)


### received_date_day

#### Detail

Day of the month when the article was received.

#### Example

    22

[Back to schema](#schema)


### received_date_month

#### Detail

Numeric value for the month when the article was received.

#### Example

    5

[Back to schema](#schema)


### received_date_timestamp

#### Detail

Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT) when the article was published, in UTC timezone.

#### Example

    1337644800

[Back to schema](#schema)


### received_date_year

#### Detail

Year when the article was published, 4 digit format.

#### Example

    2012

[Back to schema](#schema)


### refs

#### Detail

A list of references for the article. Whitespace in the values will be limited, and this list is only meant to be informational. A separate Fluidinfo object is created for each article reference, and the `ref` namespace tags hold more detailed data.

#### Example

<%= json :ARTICLE_SCHEMA_REFS %>

[Back to schema](#schema)


### research_organism

#### Detail

Research organism(s) identified in the article, if present.

#### Example

    "Other"

[Back to schema](#schema)


### subject_area

#### Detail

The subject area(s) of the article.

#### Example

    [
      "Research article",
      "Cell biology"
    ]

[Back to schema](#schema)