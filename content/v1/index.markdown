--- 
title: eLife API version 1
---


# Cover page for the API

* TOC
{:toc}

## Introduction

This is a cover page.

## Gotchas

A short list of gotchas:

### Character encoding

UTF-8 unicode encoding of content should be expected throughout the API. This includes the input XML, and the resulting Fluidinfo data values. Expect to find unicode characters.

### Encoding special characters query URL

For optimal readability, the samples provided in this documentation show space characters and quotation mark characters in query URLs. Depending on the method you use to issue the queries, these characters may be converted automatically to their URL encoded equivalents. If they are not, you will have to encode these characters. Common characters used that may require encoding:

* space encoded as %20
* " encoded as %22
  
### Case sensitive

String equality in Fluidinfo queries uses case sensitive comparisons. As a result,

* `?query=elifesciences.org/api_v1/article/doi="10.7554/eLife.00013"` will find an article object
* `?query=elifesciences.org/api_v1/article/doi="10.7554/elife.00013"` <b>will not</b> find an article object (lowercase 'L' in eLife)

To query with case insensitivity, you can use the `matches` query operator instead of the `=` sign. More detail can be found on the Fluidinfo [Query Language](http://doc.fluidinfo.com/fluidDB/queries.html) page.

### Date value formats

Date values &#8211; such as an article's accepted date or published date &#8211; are specified in multiple Fluidinfo tags. These tag values allows you to write Fluidinfo queries for a particular month or day in a month without having to parse timestamp values. For example, for an article accepted date:

* `accepted_date_date` : A human readable date string, i.e. "July 18, 2012"
* `accepted_date_day`: The day of the month, i.e. "18"
* `accepted_date_month`: The month, i.e. "07"
* `accepted_date_year`: The year, i.e. "2012"
* `accepted_date_timestamp`: Unix timestamp seconds since epoch in the UTC timezone, i.e. 1342569600

