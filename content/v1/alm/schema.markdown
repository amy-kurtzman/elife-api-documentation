---
title: ALM Schema | eLife API
class: class="schema"
---

# ALM Schema

* TOC
{:toc}

## Introduction

The ALM (Article Level Metrics) objects store a numeric value and meta data about the type and source of the metric.

The [Schema](#schema) table contains the tags at a glance, including the following columns:

Name
: A short name for the tag in the `alm` namespace.

Tag
: A partial tag path for the tag in Fluidinfo, omitting the eLife API parent namespace. To get a full Fludinfo tag path (except for the `fluiddb/about` tag path) for version 1 of the eLife API, prepend `elifesciences.org/api_v1/` to the tag. For example, the `alm/doi` tag becomes `elifesciences.org/api_v1/alm/doi` tag path in Fluidinfo.

Type
: The data type stored in the tag.

List
: Some tags that may include a lists of values. Those marked with an asterisk may sometimes contain only a single value, or a list. If no asterisk, it will always be a list.

## Schema

|---------------------------------------+------------------------+---------+-------|
| Name                                  | Tag                    | Type    | List  |
|---------------------------------------|------------------------|---------|-------+
| [about](#about)                       | fluiddb/about          | string  |       |
| [alm_source](#almsource)              | alm/alm_source         | string  |       |
| [complete](#complete)                 | alm/complete           | boolean |       |
| [date_date](#datedate)                | alm/date_date          | string  |       |
| [date_day](#dateday)                  | alm/date_day           | int     |       |
| [date_month](#datemonth)             | alm/date_month         | int     |       |
| [date_timestamp](#datetimestamp)      | alm/date_timestamp     | int     |       |
| [date_year](#dateyear)                | alm/date_year          | int     |       |
| [doi](#doi)                           | alm/doi                | string  |       |
| [timespan](#timespan)                 | alm/timespan           | string  |       |
| [type](#type)                         | alm/type               | string  |       |
| [value](#value)                       | alm/value              | int     |       |


### about

#### Detail

Fluidinfo about tag. A unique value for each object in fluidinfo. For eLife ALM objects, the about tag includes many details about the ALM value, concatenated with underscores, to provide the necessary uniqueness.

#### Example

    "elife_alm_fake_web_day_October_15_2012_10.7554/eLife.00013"

[Back to schema](#schema)


### alm_source

#### Detail

The source of ALM data. The value will match an object in the alm_source namespace, where `alm/alm_source` = `alm_source/source`.

#### Example

    "fake"

[Back to schema](#schema)



### complete

#### Detail

Whether the value reported is a complete and final number. Halfway through the current month, for example, the value reported would only represent a partial month worth of data.

#### Example

    true

[Back to schema](#schema)



### date_date

#### Detail

Human readable date for the ALM data value. Daily data may be represented as "October 15, 2012", monthly data as "October 2012" and yearly data as "2012".

#### Example

    "October 15, 2012"

[Back to schema](#schema)




### date_day

#### Detail

Day of the month for the ALM data value. The tag may be absent from monthly or yearly data points.

#### Example

    15

[Back to schema](#schema)




### date_month

#### Detail

Numeric value for the month for the ALM data value. The tag may be absent from yearly data points.

#### Example

    10

[Back to schema](#schema)




### date_timestamp

#### Detail

Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT) for the ALM data value, in UTC timezone.

#### Example

    1350259200

[Back to schema](#schema)




### date_year

#### Detail

Year for the ALM data value, 4 digit format.

#### Example

    2012

[Back to schema](#schema)


### doi

#### Detail

DOI of the article or component the ALM data corresponds to.

#### Example

    "10.7554/eLife.00013"

[Back to schema](#schema)





### timespan

#### Detail

The timespan represented in the ALM data value. Initial values are planned to be "day" for daily values, "month" for monthly values, and "year" for yearly values.

#### Example

    "day"

[Back to schema](#schema)




### type

#### Detail

The type of activity represented. For example, "web" could represent web page hits from the particular source.

#### Example

    "web"

[Back to schema](#schema)




### value

#### Detail

The numeric value of the ALM metric.

#### Example

    8

[Back to schema](#schema)