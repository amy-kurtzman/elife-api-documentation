---
title: Author Schema | eLife API
class: class="schema"
---

# Author Schema

* TOC
{:toc}

## Introduction

_

## Schema

|---------------------------------------------------------------+---------------------------------+---------+-------|
| Name                                                          | Tag                             | Type    | List  |
|---------------------------------------------------------------|---------------------------------|---------|-------+
| [about](#about)                                               | fluiddb/about                   | string  |       |
| [article_doi](#articledoi)                                    | /author/article_doi             | string  |       |
| [author](#author)                                             | /author/author                  | string  |       |
| [city](#city)                                                 | /author/city                    | string  |       |
| [corresponding](#corresponding)                               | /author/corresponding           | boolean |       |
| [country](#accepteddatetimestamp)                             | /author/country                 | string  |       |
| [department](#accepteddatetimestamp)                          | /author/department              | string  |       |
| [equal_contrib](#equalcontrib)                                | /author/equal_contrib           | boolean |       |
| [given_names](#givennames)                                    | /author/given_names             | string  |       |
| [institution](#institution)                                   | /author/institution             | string  |       |
| [notes_correspondence](#notescorrespondence)                  | /author/notes_correspondence    | string  | List* |
| [notes_footnotes](#notesfootnotes)                            | /author/notes_footnotes         | string  | List* |
| [notes_other](#notesother)                                    | /author/notes_other             | string  | List* |
| [person_id](#personid)                                        | /author/person_id               | int     |       |
| [position](#position)                                         | /author/position                | int     |       |
| [surname](#surname)                                           | /author/surname                 | string  |       |

\* Lists are only used when two or more values are present in the author data

### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife author objects, the about tag includes the corresponding article DOI and the position in which the author was listed.

#### Example

    "author_1_10.7554/eLife.00013"

[Back to schema](#schema)


### article_doi

#### Detail



#### Example



[Back to schema](#schema)




### author

#### Detail



#### Example



[Back to schema](#schema)




### city

#### Detail



#### Example



[Back to schema](#schema)




### corresponding

#### Detail



#### Example



[Back to schema](#schema)




### country

#### Detail



#### Example



[Back to schema](#schema)




### department

#### Detail



#### Example



[Back to schema](#schema)




### equal_contrib

#### Detail



#### Example



[Back to schema](#schema)




### given_names

#### Detail



#### Example



[Back to schema](#schema)




### institution

#### Detail



#### Example



[Back to schema](#schema)




### notes_correspondence

#### Detail



#### Example



[Back to schema](#schema)




### notes_footnotes

#### Detail



#### Example



[Back to schema](#schema)




### notes_other

#### Detail



#### Example



[Back to schema](#schema)




### person_id

#### Detail



#### Example



[Back to schema](#schema)




### position

#### Detail



#### Example



[Back to schema](#schema)




### surname

#### Detail



#### Example



[Back to schema](#schema)