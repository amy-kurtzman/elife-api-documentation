---
title: Article Schema | eLife API
class: class="schema"
---

# Article Schema

* TOC
{:toc}

## Introduction

_

## Article schema

|---------------------------------------------------------------------------------------------------+--------------------------------------------------+---------+-------|
| Name                                                                                              | Tag                                              | Type    | List |
|---------------------------------------------------------------------------------------------------|--------------------------------------------------|---------|-------+
| [about](#about)                                                                                   | fluiddb/about                                    | string  |       |
| [abstract](#abstract)                                                                             | /article/abstract                                | string  |       |
| [accepted_date_date](#accepteddatedate)                                                           | /article/accepted_date_date                      | string  |       |
| [accepted_date_day](#accepteddateday)                                                             | /article/accepted_date_day                       | int     |       |
| [accepted_date_month](#accepteddatemonth)                                                         | /article/accepted_date_month                     | int     |       |
| [accepted_date_timestamp](#accepteddatetimestamp)                                                 | /article/accepted_date_timestamp                 | int     |       |
| [accepted_date_year](#accepteddateyear)                                                           | /article/accepted_date_year                      | int     |       |
| [ack](#ack)                                                                                       | /article/ack                                     | string  |       |
| [article_country](#articlecountry)                                                                | /article/article_country                         | string  |       |
| [article_institution](#articleinstitution)                                                        | /article/article_institution                     | string  |       |
| [article_title](#articletitle)                                                                    | /article/article_title                           | string  |       |
| [article_type](#articletype)                                                                      | /article/article_type                            | string  |       |
| [author_notes](#authornotes)                                                                      | /article/author_notes                            | string  | Yes*  |
| [authors](#authors)                                                                               | /article/authors                                 | string  | Yes   |
| [award_group_award_id](#awardgroupawardid)                                                        | /article/award_group_award_id                    | string  | Yes*  |
| [award_group_funding_source](#awardgroupfundingsource)                                            | /article/award_group_funding_source              | string  | Yes*  |
| [award_group_principle_award_recipient](#awardgroupprincipleawardrecipient)&nbsp;&nbsp;&nbsp;     | /article/award_group_principle_award_recipient   | string  | Yes*  |
| [components](#components)                                                                         | /article/components                              | string  | Yes   |
| [conflict](#conflict)                                                                             | /article/conflict                                | string  |       |
| [copyright_holder](#copyrightholder)                                                              | /article/copyright_holder                        | string  |       |
| [copyright_statement](#copyrightstatement)                                                        | /article/copyright_statement                     | string  |       |
| [copyright_year](#copyrightyear)                                                                  | /article/copyright_year                          | string  |       |
| [correspondence](#correspondence)                                                                 | /article/correspondence                          | string  |       |
| [doi](#doi)                                                                                       | /article/doi                                     | string  |       |
| [doi_url](#doiurl)                                                                                | /article/doi_url                                 | string  |       |
| [funding_statement](#fundingstatement)                                                            | /article/funding_statement                       | string  |       |
| [journal_id](#journalid)                                                                          | /article/journal_id                              | string  |       |
| [journal_issn_epub](#journalissnepub)                                                             | /article/journal_issn_epub                       | string  |       |
| [journal_issn_ppub](#journalissnppub)                                                             | /article/journal_issn_ppub                       | string  |       |
| [journal_title](#journaltitle)                                                                    | /article/journal_title                           | string  |       |
| [keywords](#keywords)                                                                             | /article/keywords                                | string  | Yes*  |
| [license](#license)                                                                               | /article/license                                 | string  |       |
| [license_type](#licensetype)                                                                      | /article/license_type                            | string  |       |
| [license_url](#licenseurl)                                                                        | /article/license_url                             | string  |       |
| [pmid](#pmid)                                                                                     | /article/pmid                                    | string  |       |
| [pub_date_date](#pubdatedate)                                                                     | /article/pub_date_date                           | string  |       |
| [pub_date_day](#pubdateday)                                                                       | /article/pub_date_day                            | int     |       |
| [pub_date_month](#pubdatemonth)                                                                   | /article/pub_date_month                          | int     |       |
| [pub_date_timestamp](#pubdatetimestamp)                                                           | /article/pub_date_timestamp                      | int     |       |
| [pub_date_year](#pubdateyear)                                                                     | /article/pub_date_year                           | int     |       |
| [publisher](#publisher)                                                                           | /article/publisher                               | string  |       |
| [received_date_date](#receiveddatedate)                                                           | /article/received_date_date                      | string  |       |
| [received_date_day](#receiveddateday)                                                             | /article/received_date_day                       | int     |       |
| [received_date_month](#receiveddatemonth)                                                         | /article/received_date_month                     | int     |       |
| [received_date_timestamp](#receiveddatetimestamp)                                                 | /article/received_date_timestamp                 | int     |       |
| [received_date_year](#receiveddateyear)                                                           | /article/received_date_year                      | int     |       |
| [refs](#refs)                                                                                     | /article/refs                                    | string  | Yes   |
| [research_organism](#researchorganism)                                                            | /article/research_organism                       | string  | Yes*   |
| [subject_area](#subjectarea)                                                                      | /article/subject_area                            | string  | Yes*   |

\* Lists are only used when two or more values are present in the article


### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife article objects, the about tag is the article DOI in its URL compatible format.

#### Example

http://dx.doi.org/10.7554/eLife.00013

[Back to schema](#article-schema-1)


### accepted_date_date

#### Detail

Human readable date for when the article was accepted.

#### Example

July 18, 2012

[Back to schema](#article-schema-1)


### accepted_date_day

#### Detail

Day of the month when the article was accepted, in 2 digits with leading zeros.

#### Example

18

[Back to schema](#article-schema-1)


### accepted_date_month

#### Detail

Numeric value for the month when the article was accepted, in 2 digits with leading zeros.

#### Example

07

[Back to schema](#article-schema-1)


### accepted_date_timestamp

#### Detail

Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT) when the article was accepted, in UTC timezone.

#### Example

1342569600

[Back to schema](#article-schema-1)


### accepted_date_year

#### Detail

Year when the article was accepted, 4 digit format.

#### Example

2012

[Back to schema](#article-schema-1)


### ack

#### Detail

Acknowledgements.

#### Example

AcknowledgementsWe thank Michael Fischbach, Richard Losick, and Russell Vance for critical reading of the manuscript. NK is a Fellow in the Integrated Microbial Biodiversity Program of the Canadian Institute for Advanced Research.

[Back to schema](#article-schema-1)


### article_country

#### Detail

Country for the article as a whole, if present. If not present, each author's country may provide more detail.

#### Example



[Back to schema](#article-schema-1)


### article_institution

#### Detail

Institution for the article as a whole, if present. If not present, each author's institution may provide more detail.

#### Example



[Back to schema](#article-schema-1)


### article_title

#### Detail

Title of the article.

#### Example

A bacterial sulfonolipid triggers multicellular development in the closest living relatives of animals

[Back to schema](#article-schema-1)


### article_type

#### Detail

Type of article. Values may include "research-article", "editorial", "article-commentary".

#### Example

research-article

[Back to schema](#article-schema-1)


### author_notes

#### Detail

Author notes for the article as whole. Individual author objects may contain more detail about notes pertaining to a particular author.

#### Example

†These authors contributed equally to this work.

[Back to schema](#article-schema-1)


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

[Back to schema](#article-schema-1)


### award_group_award_id

#### Detail



#### Example



[Back to schema](#article-schema-1)


### award_group_funding_source

#### Detail



#### Example



[Back to schema](#article-schema-1)


### award_group_principle_award_recipient

#### Detail



#### Example



[Back to schema](#article-schema-1)


### components

#### Detail



#### Example



[Back to schema](#article-schema-1)


### conflict

#### Detail



#### Example



[Back to schema](#article-schema-1)


### copyright_holder

#### Detail



#### Example



[Back to schema](#article-schema-1)


### copyright_statement

#### Detail



#### Example



[Back to schema](#article-schema-1)


### copyright_year

#### Detail



#### Example



[Back to schema](#article-schema-1)


### correspondence

#### Detail



#### Example



[Back to schema](#article-schema-1)


### doi

#### Detail



#### Example



[Back to schema](#article-schema-1)


### doi_url

#### Detail



#### Example



[Back to schema](#article-schema-1)


### funding_statement

#### Detail



#### Example



[Back to schema](#article-schema-1)


### journal_id

#### Detail



#### Example



[Back to schema](#article-schema-1)


### journal_issn_epub

#### Detail



#### Example



[Back to schema](#article-schema-1)


### journal_issn_ppub

#### Detail



#### Example



[Back to schema](#article-schema-1)


### journal_title

#### Detail



#### Example



[Back to schema](#article-schema-1)


### keywords

#### Detail



#### Example



[Back to schema](#article-schema-1)


### license

#### Detail



#### Example



[Back to schema](#article-schema-1)


### license_type

#### Detail



#### Example



[Back to schema](#article-schema-1)


### license_url

#### Detail



#### Example



[Back to schema](#article-schema-1)


### pmid

#### Detail



#### Example



[Back to schema](#article-schema-1)


### pub_date_date

#### Detail



#### Example



[Back to schema](#article-schema-1)


### pub_date_day

#### Detail



#### Example



[Back to schema](#article-schema-1)


### pub_date_month

#### Detail



#### Example



[Back to schema](#article-schema-1)


### pub_date_timestamp

#### Detail



#### Example



[Back to schema](#article-schema-1)


### pub_date_year

#### Detail



#### Example



[Back to schema](#article-schema-1)


### publisher

#### Detail



#### Example



[Back to schema](#article-schema-1)


### received_date_date

#### Detail



#### Example



[Back to schema](#article-schema-1)


### received_date_day

#### Detail



#### Example



[Back to schema](#article-schema-1)


### received_date_month

#### Detail



#### Example



[Back to schema](#article-schema-1)


### received_date_timestamp

#### Detail



#### Example



[Back to schema](#article-schema-1)


### received_date_year

#### Detail



#### Example



[Back to schema](#article-schema-1)


### refs

#### Detail



#### Example



[Back to schema](#article-schema-1)


### research_organism

#### Detail



#### Example



[Back to schema](#article-schema-1)


### subject_area

#### Detail



#### Example



[Back to schema](#article-schema-1)