--- 
title: eLife Developers Home
---


# eLife API. 

* TOC
{: toc}


## Background. 

Our philosophy is to make [eLife][el] content proiscous, and to make it as easy as possible for the content to flow to as many locations as possible. With that in mind we have created a REST api to the content. In addition to the REST api access to content is also availalbe via [RSS], and OAI end point, and through a number of external endpoints that are not managed by eLife. Documentation on this site mainly covers the REST api, but we include inforamtion on the other endpoints, and on how to get to external endpoionts. 


## Quick start guide. 

For the REST API, eLife content is hosted using [FluidInfo] in the fluidinfo namespace `elifescineces.org`. If you want to dive straigt in then then api url for eLife content is ``. You can get started by making calls to this endpoint. We have provided a set of [example queries][eq]. For example the following query will return the DOI of items published in the last month:

`some cool query goes here.`

[eq]: /v1/usecases/


## Developer resources. 

This documentation is [hosted on github][gdocs]. You clone the repo here. In addition we have made avaialbe [the code][parser] that we use to parse our aritlce XML for population of the API. We have created a [mailing list/google group][ml] for discussion around our API, however we are unable to respond quickly to this list. There is substantial [fluidinfo documentation][fid] available.

[parser]: parser.com
[gdocs]: github.com
[ml]: groups.com
[fid]: fluidinfo.com 


## FluidInfo.

[Fluidinfo][fi] is an object data store that we have used for hosting eLife data for the purposes of providing a REST API. You can read the [fluidinfo documentation][fid], sign up for [an acocunt][fia], though accounts are not ewquired to make read only calls to the API. We have provided a 

[fi]: fluidinfo.com
[fia]: fluidinfoaccoutns.com

## Rest API namespaces.


## JSONP. 


## The Object Model, a writable API. 


## Roadmap for the REST API.


## RSS/OAI. 


## External Endpoints. 

