---
title: Author Schema | eLife API
class: class="schema"
---

# Author Schema

* TOC
{:toc}

## Introduction

For each author of an article, a new Fluidinfo object is created. Tag values in the `author` namespace store individual author details. As such, it is possible for more than one author object to exist for the same person, and these objects are attributed directly to the article they authored.

The [Schema](#schema) table contains the tags at a glance, including the following columns:

Name
: A short name for the tag in the `author` namespace.

Tag
: A partial tag path for the tag in Fluidinfo, omitting the eLife API parent namespace. To get a full Fludinfo tag path (except for the `fluiddb/about` tag path) for version 1 of the eLife API, prepend `elifesciences.org/api_v1/` to the tag. For example, the `author/article_doi` tag becomes `elifesciences.org/api_v1/author/article_doi` tag path in Fluidinfo.

Type
: The data type stored in the tag.

List
: Some tags that may include a lists of values. Those marked with an asterisk may sometimes contain only a single value, or a list. If no asterisk, it will always be a list.

## Schema

|---------------------------------------------------------------+--------------------------------+---------+-------|
| Name                                                          | Tag                            | Type    | List  |
|---------------------------------------------------------------|--------------------------------|---------|-------+
| [about](#about)                                               | fluiddb/about                  | string  |       |
| [article_doi](#articledoi)                                    | author/article_doi             | string  |       |
| [author](#author)                                             | author/author                  | string  |       |
| [city](#city)                                                 | author/city                    | string  | List* |
| [corresponding](#corresponding)                               | author/corresponding           | boolean |       |
| [country](#country)                             | author/country                 | string  | List* |
| [department](#department)                          | author/department              | string  | List* |
| [equal_contrib](#equalcontrib)                                | author/equal_contrib           | boolean |       |
| [given_names](#givennames)                                    | author/given_names             | string  |       |
| [institution](#institution)                                   | author/institution             | string  | List* |
| [notes_correspondence](#notescorrespondence)                  | author/notes_correspondence    | string  | List* |
| [notes_footnotes](#notesfootnotes)                            | author/notes_footnotes         | string  | List* |
| [notes_other](#notesother)                                    | author/notes_other             | string  | List* |
| [person_id](#personid)                                        | author/person_id               | int     |       |
| [position](#position)                                         | author/position                | int     |       |
| [surname](#surname)                                           | author/surname                 | string  |       |

\* Lists are only used when two or more values are present in the author data

### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife author objects, the about tag includes the corresponding article DOI and the position in which the author was listed.

#### Example

    "author_1_10.7554/eLife.00013"

[Back to schema](#schema)


### article_doi

#### Detail

The article DOI for which the author is an author. This tag provides a method to find all authors of a particular article by DOI. `author/article_doi` value matches `article/doi`.

#### Example

    "10.7554/eLife.00013"

[Back to schema](#schema)




### author

#### Detail

Full name of the author. The value should match one of the list values stored in `article/authors`.

#### Example

    "Rosanna A Alegado"

[Back to schema](#schema)




### city

#### Detail

City or cities of the author, if available. It may contain a list, if the author has more than one affiliated organisation.

#### Example

    "Berkeley"

[Back to schema](#schema)




### corresponding

#### Detail

Whether the author is to be contacted with correspondence. If a tag value is not present, assume the value is false.

#### Example

    true

[Back to schema](#schema)




### country

#### Detail

Country or countries of the author, if available. It may contain a list, if the author has more than one affiliated organisation.

#### Example

    "United States"

[Back to schema](#schema)




### department

#### Detail

Department(s) of the author, if available. It may contain a list, if the author has more than one affiliated organisation.

#### Example

    "Department of Molecular and Cell Biology"

[Back to schema](#schema)




### equal_contrib

#### Detail

Whether the author is identified to have provided equal contribution to the article.

#### Example

    true

[Back to schema](#schema)




### given_names

#### Detail

Given names of the author.

#### Example

    "Rosanna A"

[Back to schema](#schema)




### institution

#### Detail

Institution(s) of the author, if present. It may contain a list, if the author has more than one affiliated organisation.

#### Example

    "University of California, Berkeley"

[Back to schema](#schema)




### notes_correspondence

#### Detail

Article footnotes pertaining to correspondence, for the particular author.

#### Example

    "*For correspondence: jon_clardy@hms.harvard.edu (JC); nking@berkeley.edu (NK)"

[Back to schema](#schema)




### notes_footnotes

#### Detail

Article footnotes for the particular author, not including footnotes regarding correspondence or "other" footnotes.

#### Example

    [
        "†These authors contributed equally to this work.",
        "RA: Conception and design, Acquisition of data, Analysis and interpretation of data, Drafting or revising the article",
        "The remaining authors have no competing interests to declare."
    ]

[Back to schema](#schema)




### notes_other

#### Detail

Footnotes for the author of the type "other", which tends to hold funding details disclosed for the particular author.

#### Example

    "National Institutes of Health F32 GM086054 Alegado Rosanna A."

[Back to schema](#schema)




### person_id

#### Detail

eLife person ID, unique identifier assigned by eJournalPress software for eLife authors.

#### Example

    1668

[Back to schema](#schema)




### position

#### Detail

Position (order) in which the author was listed in the article. Starts at 1.

#### Example

    1

[Back to schema](#schema)




### surname

#### Detail

Surname of the author.

#### Example

    "Alegado"

[Back to schema](#schema)