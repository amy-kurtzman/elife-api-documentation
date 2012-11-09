--- 
title: eLife Developers Home
---


# eLife API. 

* TOC
{: toc}


## Background

Our philosophy is to make [eLife][el] content promiscuous, and to make it as easy as possible for the content to flow to as many locations as possible. With that in mind we have created a REST API to the content. In addition to the REST API access to content is also available via [RSS], and OAI end point, and through a number of external endpoints that are not managed by eLife. Documentation on this site mainly covers the REST API, but we include information on the other endpoints, and on how to get to external endpoints. 


## Quick start guide 

For the REST API, eLife content is hosted using [FluidInfo] under the fluidinfo namespace `elifescineces.org`. If you want to dive straight in, the base url for eLife content is `https://fluiddb.fluidinfo.com/`. You can get started by making calls to this endpoint. We have provided a set of [example queries][eq]. For example the following query will return the DOI of items published in the last month:

`some cool query goes here.`

[eq]: /v1/usecases/


## Developer resources

This documentation is [hosted on github][gdocs]. In addition we will make available the code that we use to parse our article XML for population of the API. We have created a [mailing list/google group][ml] for discussion around our API, however we are unable to respond quickly to this list. There is substantial [fluidinfo documentation][fid] available. 

[parser]: parser.com
[gdocs]: https://github.com/elifesciences/elife-api-documentation
[ml]: https://groups.google.com/forum/?fromgroups#!forum/elife-api
[fid]: fluidinfo.com 


## FluidInfo

[Fluidinfo][fi] is an object data store that we have used for hosting eLife data for the purposes of providing a REST API. You can read the [fluidinfo documentation][fid], sign up for [an account][fia], though accounts are not required to make read only calls to the API.

[fi]: fluidinfo.com
[fia]: fluidinfoaccoutns.com


## Rest API namespaces

As we are mapping from our XML into fluifinfo objects, to understand the API, all you need to do is to understand the namespaces we have chosen to describe our objects. We have [documented this extensivly][rest], but you can also use a tool provided by fluidinfo to [explore the namespace][explorer].

[rest]: /v1/
[explorer]: https://explorer.fluidinfo.com/fluidinfo/elifesciences.org

## JSONP


## The Object Model, a writeable API


## Roadmap for the REST API

We have posted the development roadmap on a [trello board][tb]

[tb]: https://trello.com/board/elife-api-roadmap/50194e22705438553d59640c 


## RSS/OAI

We are aiming to launch the journal website shortly. This will provide RSS and OAI endpoints for our content, and this documentation will be updated at that point. 


## External Endpoints

We are making eLife content avaialbe from a number of non-eLife controlled endpoints, with the aim of making it as easy as possible for people to access the content. We will try to keep up to date documentation on these endpoints [here][eep]. If you have a resource that you think is releveant, and you would like us to add to the documentation, please drop us a line in the [group][ml], or send a pull request to the [documentation repo][gdocs]. 

[eep]: /external-endpoints/