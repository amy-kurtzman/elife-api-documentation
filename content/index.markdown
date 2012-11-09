--- 
title: eLife Developers Home
---


# eLife API. 

* TOC
{: toc}


## Background

Our philosophy is to make [eLife][el] content promiscuous, and to make it as easy as possible for the content to flow to as many locations as possible. With that in mind we have created a REST API to the content. In addition to the REST API access to content is also available via [RSS], and OAI end point, and through a number of external endpoints that are not managed by eLife. Documentation on this site mainly covers the REST API, but we include information on the other endpoints, and on how to get to external endpoints. 


## Quick start guide 

For the REST API, eLife content is hosted using [FluidInfo] under the fluidinfo namespace `elifescineces.org`. If you want to dive straight in, the base url for eLife content is `https://fluiddb.fluidinfo.com/`. You can get started by making calls to this endpoint. We have provided a set of [example queries][eq]. For example the following query will return all articles in a particular subject area:

`GET /values?query=elifesciences.org/api_v1/article/subject_area contains "Cell biology"&tag=elifesciences.org/api_v1/article/doi`

and the curl version of this operation is:

	curl "https://fluiddb.fluidinfo.com/values?query=elifesciences.org%2Fapi_v1%2Farticle%2Fsubject_area+contains+%22Cell+biology%22&tag=elifesciences.org%2Fapi_v1%2Farticle%2Fdoi"

[eq]: /v1/usecases/


## Developer resources

This documentation is [hosted on github][gdocs]. In addition we will make available the code that we use to parse our article XML for population of the API. We have created a [mailing list/google group][ml] for discussion around our API, however we are unable to respond quickly to this list. There is substantial [fluidinfo documentation][fid] available. 

[parser]: parser.com
[gdocs]: https://github.com/elifesciences/elife-api-documentation
[ml]: https://groups.google.com/forum/?fromgroups#!forum/elife-api
[fid]: fluidinfo.com 


## FluidInfo

[Fluidinfo][fi] is an object data store that we have used for hosting eLife data for the purposes of providing a REST API. You can read the [fluidinfo documentation][fid] and sign up for [an account][fia], although accounts are not required to make read only calls to the API. We have added a bit more detail about fluidinfo, and the resources available [here][fol].

[fi]: fluidinfo.com
[fia]: fluidinfoaccoutns.com
[fol]: /v1/fluidinfo/


## REST API namespaces

As we are mapping from our XML into fluifinfo objects, to understand the API, all you need to do is to understand the namespaces we have chosen to describe our objects. We have [documented this extensively][rest], but you can also use a tool provided by fluidinfo to [explore the namespace][explorer].

[rest]: /v1/
[explorer]: https://explorer.fluidinfo.com/fluidinfo/elifesciences.org

## JSONP

Fluidinfo support for JSONP is documented [here][jsonp].

[jsonp]: http://doc.fluidinfo.com/fluidDB/api/http.html#support-for-jsonp 


## The Object Model, a writeable API

One of the powerful things about fluidinfo is that _other_ people can start adding their own information onto objects that we create about eLife articles. We are in effect allowing you to tag, annotate or make comments at a very granular level on information about eLife authors and papers. We will also be _decorating_ eLife articles with article level metrics, from a variety of sources, but if you have other data that you want to add, you can do that too. 

In the image below you can see a visual representation of an object that we have created in fluidinfo. This represents the data that we have populated about the article with the DOI dx.doi.org/10.7554/eLife.00242. We are using the doi of an article as the fluidinfo _about_ tag, as it is the best unique primary descriptor of objects that we are creating. 

You can see that we have added information onto the object as essentially key-value pairs. The beautiful thing about this approach is that you can go [sign up] for a fluidinfo key, and start adding your own metadata too. We hope to start aggregating useful information that appears this way, and exposing it on the original article pages, and to the authors. 

<img src="/images/object.jpg" alt="example object" height="270" width="700">

## Roadmap for the REST API

We have posted the development roadmap on a [trello board][tb]. It should be treated with appropriate levels of caution and scepticism. 

[tb]: https://trello.com/board/elife-api-roadmap/50194e22705438553d59640c 


## RSS/OAI

We are aiming to launch the journal website shortly. This will provide RSS and OAI-PMH endpoints for our content, and this documentation will be updated at that point. 


## External endpoints

We are making eLife content available from a number of non-eLife controlled endpoints, with the aim of making it as easy as possible for people to access the content. We will update documentation on this site about these endpoints, however you can already browse some eLife content on [scribd][sd], [Mendeley][men] and [github xml][gha] and [github pdf][ghp] repos. If you have a resource that you think is relevant, and you would like us to add to the documentation, please drop us a line in the [group][ml], or send a pull request to the [documentation repo][gdocs]. 

[sd]: http://www.scribd.com/my_document_collections/3916165
[men]: http://www.mendeley.com/profiles/elife-staff/
[gha]: http://elifesciences.github.com/elife-articles/
[ghp]: https://github.com/elifesciences/elife-pdfs

