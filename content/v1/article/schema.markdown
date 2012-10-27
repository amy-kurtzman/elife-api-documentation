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

    [
      "Agosta WC. 1992. Chemical communication. Scientific American Press , New York.",
      "Ahmed I Yokota A Fujiwara T. 2007. Chimaereicella boritolerans sp nov., a boron-tolerant and alkaliphilic bacterium of the family Flavobacteriaceae isolated from soil. Int J Syst Evol Microbiol 57: 986 \u2013 992.",
      "Alegado RA Grabenstatter JD Zuzow R Morris A Huang SY Summons RE King N. 2012. Algoriphagus machipongonensis sp. nov. co-isolated with a colonial choanoflagellate. Int J Syst Evol Microbiol [epub ahead of print].",
      "An D Na C Bielawski J Hannun YA Kasper DL. 2011. Membrane sphingolipids as essential molecular signals for Bacteroides survival in the intestine. Proc Natl Acad Sci U S A 108 Suppl. 1: 4666 \u2013 4671.",
      "Anton J Oren A Benlloch S Rodriguez-Valera F Amann R Rossello-Mora R. 2002. Salinibacter ruber gen. nov., sp nov., a novel, extremely halophilic member of the bacteria from saltern crystallizer ponds. Int J Syst Evol Microbiol 52: 485 \u2013 491.",
      "Apicella MA. 2008. Isolation and characterization of lipopolysaccharides. Methods Mol Biol 431: 3 \u2013 13.",
      "Atlas RM. 2004. Handbook of microbiological media , p. 2051. Boca Raton: CRC.",
      "Barbeyron T L\u2019Haridon S Corre E Kloareg B Potin P. 2001. Zobellia galactanovorans gen. nov., sp. nov., a marine species of Flavobacteriaceae isolated from a red alga, and classification of [Cytophaga] uliginosa (ZoBell and Upham 1944) Reichenbach 1989 as Zobellia uliginosa gen. nov., comb. nov. Int J Syst Evol Microbiol 51 (Pt 3): 985 \u2013 997.",
      "Bernardet J Segers P Vancanneyt M Berthe F Kersters K Vandamme P. 1996. Cutting a Gordian knot: Emended classification and description of the genus Flavobacterium, emended description of the family Flavobacteriaceae, and proposal of Flavobacterium hydatis nom nov (basonym, Cytophaga aquatilis Strohl and Tait 1978). Int J Syst Bacteriol 46: 128 \u2013 148.",
      "Blattner FR Plankett G III Bloch CA Perna N Burland V Riley M Collado-Vides J Glasner JD Rode CK Mayhew GF. 1997. The complete genome sequence of Escherichia coli K-12. Science 277: 1453 \u2013 1462.",
      "Bligh EG Dyer WJ. 1959. A rapid method of total lipid extraction and purification. Can J Biochem Physiol 37: 911 \u2013 917.",
      "Bowman JP Nichols CM Gibson JAE. 2003. Algoriphagus ratkowskyi gen. nov., sp. nov., Brumimicrobium glaciale gen. nov., sp. nov., Cryomorpha ignava gen. nov., sp. nov. and Crocinitomix catalasitica gen. nov., sp. nov., novel flavobacteria isolated from various polar habitats. Int J Syst Evol Microbiol 53 (Pt 5): 1343 \u2013 1355.",
      "Bradley RK Roberts A Smoot M Juvekar S Do J Dewey C Holmes I Pachter L. 2009. Fast statistical alignment. PLoS Comput Biol 5: e1000392.",
      "Brettar I Christen R Hofle M. 2004a. Aquiflexum balticum gen. nov., sp nov., a novel marine bacterium of the Cytophaga-Flavobacterium-Bacteroides group isolated from surface water of the central Baltic Sea. Int J Syst Evol Microbiol 54: 2335 \u2013 2341.",
      "Brettar I Christen R Hofle MG. 2004b. Belliella baltica gen. nov., sp. nov., a novel marine bacterium of the Cytophaga-Flavobacterium-Bacteroides group isolated from surface water of the central Baltic Sea. Int J Syst Evol Microbiol 54 (Pt 1): 65 \u2013 70.",
      "Burkholder PR Giles NH. 1947. Induced biochemical mutations in Bacillus subtilis. Am J Bot 34: 345 \u2013 348.",
      "Butenandt A Beckmann R Hecker E. 1961. On the sex attractant of silk-moths. I. The biological test and the isolation of the pure sex-attractant bombykol. Hoppe-Seylers Z Physiol Chem 324: 71 \u2013 83.",
      "Carlucci AF Pramer D. 1957. Factors influencing the plate method for determining abundance of bacteria in sea water. Proc Soc Exp Biol Med 96: 392 \u2013 394.",
      "Carr M Leadbeater BSC Hassan R Nelson M Baldauf SL. 2008. Molecular phylogeny of choanoflagellates, the sister group to Metazoa. Proc Natl Acad Sci U S A 105: 16641 \u2013 16646.",
      "Castresana J. 2000. Selection of conserved blocks from multiple alignments for their use in phylogenetic analysis. Mol Biol Evol 17: 540 \u2013 552.",
      "Cerdeno-Tarraga AM Patrick S Crossman L Blakely GW Abratt V Lennard N Poxton I Duerden B Harris B Quail MA. 2005. Extensive DNA inversions in the B. fragilis genome control variable gene expression. Blakely GW , editor. Science 307: 1463 \u2013 1465.",
      "Chelius M Triplett E. 2000. Dyadobacter fermentans gen. nov., sp nov., a novel gram-negative bacterium isolated from surface-sterilized Zea mays stems. Int J Syst Evol Microbiol 50: 751 \u2013 758.",
      "Cho J-C Giovannoni SJ. 2003. Croceibacter atlanticus gen. nov., sp. nov., a novel marine bacterium in the family Flavobacteriaceae. Syst Appl Microbiol 26: 76 \u2013 83.",
      "Cho J-C Giovannoni SJ. 2004. Robiginitalea biformata gen. nov., sp. nov., a novel marine bacterium in the family Flavobacteriaceae with a higher G+C content. Int J Syst Evol Microbiol 54 (Pt 4): 1101 \u2013 1106.",
      "Cohn ZA Morse SI. 1960. Functional and metabolic properties of polymorphonuclear leucocytes. II. The influence of a lipopolysaccharide endotoxin. J Exp Med 111: 689 \u2013 704.",
      "Dayel MJ Alegado RA Fairclough SR Levin TC Nichols SA McDonald K King N. 2011. Cell differentiation and morphogenesis in the colony-forming choanoflagellate Salpingoeca rosetta. Dev Biol 357: 73 \u2013 82.",
      "DeSantis TZ Hugenholtz P Larsen N Rojas M Brodie EL Keller K Huber T Dalevi D Hu P Andersen GL. 2006. Greengenes, a chimera-checked 16S rRNA gene database and workbench compatible with ARB. Appl Environ Microbiol 72: 5069 \u2013 5072.",
      "Desbrosses GJ Stougaard J. 2011. Root nodulation: A paradigm for how plant-microbe symbiosis influences host developmental pathways. Cell Host Microbe 10: 348 \u2013 358.",
      "Drijber R McGill W. 1994. Sulfonolipid content of Cytophaga and Flexibacter species isolated from soil and cultured under different nutrient and temperature regimes. Can J Microbiol 40: 132 \u2013 139.",
      "Edman DC Pollock MB Hall ER. 1968. Listeria monocytogenes L forms. I. Induction maintenance, and biological characteristics. J Bacteriol 96: 352 \u2013 357.",
      "Fairclough SR Dayel MJ King N. 2010. Multicellular development in a choanoflagellate. Curr Biol 20: R875 \u2013 R876.",
      "Falenstein J. 1989. PHYLIP\u2014Phylogeny inference packages (version 3.2). Cladistics. 5: 164 \u2013 166.",
      "Falke JJ Bass RB Butler SL Chervitz SA Danielson MA. 1997. The two-component signaling pathway of bacterial chemotaxis: A molecular view of signal transduction by receptors, kinases, and adaptation enzymes. Annu Rev Cell Dev Biol 13: 457 \u2013 512.",
      "Falkow S. 2006. Is persistent bacterial infection good for your health? Cell 124: 699 \u2013 702.",
      "Garrity GM. 2010. Bergey\u2019s manual of systematic bacteriology: Bacteroidetes, spirochetes, tenericutes (mollicutes), acidobacteria, fibrobacteres, fusobacteria, dictyoglomi, gemmatimonadetes, lentisphaerae, verrucomicrobia, chlamydiae, and planctomycetes , p. 949. New York: Springer Verlag.",
      "Godchaux W Leadbetter ER. 1980. Capnocytophaga spp. contain sulfonolipids that are novel in procaryotes. J Bacteriol 144: 592 \u2013 602.",
      "Godchaux W Leadbetter ER. 1983. Unusual sulfonolipids are characteristic of the Cytophaga-Flexibacter group. J Bacteriol 153: 1238 \u2013 1246.",
      "Godchaux W Leadbetter ER. 1984. Sulfonolipids of gliding bacteria. Structure of the N-acylaminosulfonates. J Biol Chem 259: 2982 \u2013 2990.",
      "Godchaux W Leadbetter E. 1988. Sulfonolipids are localized in the outer membrane of the gliding bacterium Cytophaga johnsonae. Arch Microbiol 150: 42 \u2013 47.",
      "Hannich JT Umebayashi K Riezman H. 2011. Distribution and functions of sterols and sphingolipids. Cold Spring Harb Perspect Biol 3: pii: a004762. doi: 10.1101/cshperspect.a004762.",
      "Hannun YA Luberto C Argraves KM. 2001. Enzymes of sphingolipid metabolism: From modular to integrative signaling. Biochemistry 40: 4893 \u2013 4903.",
      "Herr DR Fyrst H Phan V Heinecke K Georges R Harris GL Saba JD. 2003. Sply regulation of sphingolipid signaling molecules is essential for Drosophila development. Development 130: 2443 \u2013 2453.",
      "Hibberd DJ. 1975. Observations on the ultrastructure of the choanoflagellate Codosiga botrytis (Ehr.) Saville-Kent with special reference to the flagellar apparatus. J Cell Sci 17: 191 \u2013 219.",
      "Hoffmann JA Kafatos FC Janeway CA Ezekowitz RA. 1999. Phylogenetic perspectives in innate immunity. Science 284: 1313 \u2013 1318.",
      "Hughes DT Sperandio V. 2008. Inter-kingdom signalling: Communication between bacteria and their hosts. Nat Rev Microbiol 6: 111 \u2013 120.",
      "James-Clark H. 1867. On the spongiae ciliatae as infusoria flagellata; or observations on the structure, animality, and relationship of Leucosolenia botryoides, Bowerbank. Memoirs Boston Soc. Of Nat. Hist. I, two plates.",
      "de Jonge BL Chang YS Gage D Tomasz A. 1992. Peptidoglycan composition in heterogeneous Tn551 mutants of a methicillin-resistant Staphylococcus aureus strain. J Biol Chem 267: 11255 \u2013 11259.",
      "Kamiyama T Umino T Itezono Y Nakamura Y Satoh T Yokose K. 1995a. Sulfobacins A and B, novel von Willebrand factor receptor antagonists. II. Structural elucidation. J Antibiot 48: 929 \u2013 936.",
      "Kamiyama T Umino T Satoh T Sawairi S Shirane M Ohshima S Yokose K. 1995b. Sulfobacins A and B, novel von Willebrand factor receptor antagonists. I. Production, isolation, characterization and biological activities. J. Antibiot 48: 924 \u2013 928.",
      "Karpov SA Coupe SJ. 1998. A revision of choanoflagellate genera Kentrosiga, Schiller, 1953 and Desmarella, Kent, 1880. Acta Protozoologica 37: 23 \u2013 27.",
      "Kimbrell DA Beutler B. 2001. The evolution and genetics of innate immunity. Nat Rev Genet 2: 256 \u2013 267.",
      "King N. 2004. The unicellular ancestry of animal development. Dev Cell 7: 313 \u2013 325.",
      "King N Carroll SB. 2001. A receptor tyrosine kinase from choanoflagellates: Molecular insights into early animal evolution. Proc Natl Acad Sci U S A 98: 15032 \u2013 15037.",
      "King N Hittinger CT Carroll SB. 2003. Evolution of key cell signaling and adhesion protein families predates animal origins. Science 301: 361 \u2013 363.",
      "King N Westbrook MJ Young SL Kuo A Abedin M Chapman J Fairclough S Hellsten U Isogai Y. 2008. The genome of the choanoflagellate Monosiga brevicollis and the origin of metazoans. Nature 451: 783 \u2013 788.",
      "King N Young SL Abedin M Carr M Leadbeater BSC. 2009. Starting and maintaining Monosiga brevicollis cultures. Cold Spring Harb Protoc. 2009: pdb.prot5148.",
      "Kobayashi J Mikami S Shigemori H Takao TYS Izuta S Yoshida S. 1995. Flavocristamides A and B, new DNA polymerase \u03b1 inhibitors from a marine bacterium sp. Tetrahedron 51: 10487 \u2013 10490.",
      "Kopp EB Medzhitov R. 1999. The Toll-receptor family and control of innate immunity. Curr Opin Immunol 11: 13 \u2013 18.",
      "Koropatnick TA Engle JT Apicella MA Stabb EV Goldman WE Mcfall-Ngai MJ. 2004. Microbial factor-mediated development in a host-bacterial mutualism. Science 306: 1186 \u2013 1188.",
      "Kreft JM. 2010. Effects of forming multicellular colonies or attaching to surfaces on feeding rates of the choanoflagellate Salpingoeca rosetta. Koehl M , editor. Thesis (M.A. in Integrative Biology). University of California , Berkeley.",
      "Kunst F Ogasawara N Moszer I Albertini AM Alloni G Azevedo V Bertero MG Bessi\u00e8res P Bolotin A Borchert S. 1997. The complete genome sequence of the gram-positive bacterium Bacillus subtilis. Nature 390: 249 \u2013 256.",
      "Leadbeater BSC. 1983. Life-history and ultrastructure of a new marine species of Proterospongia (Choanoflagellida). J Mar Biol Assoc UK 63: 135 \u2013 160.",
      "Lee YK Mazmanian SK. 2010. Has the microbiota played a critical role in the evolution of the adaptive immune system? Science 330: 1768 \u2013 1773.",
      "Lewin R. 1969. A classification of flexibacteria. J Gen Microbiol 58: 189 \u2013 206.",
      "Matsunaga T Okamura Y Fukuda Y Wahyudi AT Murase Y Takeyama H. 2005. Complete genome sequence of the facultative anaerobic magnetotactic bacterium Magnetospirillum sp. strain AMB-1. DNA Res 12: 157 \u2013 166.",
      "Matsuo Y Suzuki M Kasai H Shizuri Y Harayama S. 2003. Isolation and phylogenetic characterization of bacteria capable of inducing differentiation in the green alga Monostroma oxyspermum. Environ Microbiol 5: 25 \u2013 35.",
      "Matsuo Y Imagawa H Nishizawa M Shizuri Y. 2005. Isolation of an algal morphogenesis inducer from a marine bacterium. Science 307: 1598.",
      "Mazmanian SK Liu CH Tzianabos AO Kasper DL. 2005. An immunomodulatory molecule of symbiotic bacteria directs maturation of the host immune system. Cell 122: 107 \u2013 118.",
      "Mazmanian SK Round JL Kasper DL. 2008. A microbial symbiosis factor prevents intestinal inflammatory disease. Nature 453: 620 \u2013 625.",
      "McFall-Ngai M. 1999. Consequences of evolving with bacterial symbionts: Insights from the squid-vibrio associations. Ann Rev Ecol Syst 30: 235 \u2013 256.",
      "Medzhitov R Janeway C. 2000. Innate immune recognition: Mechanisms and pathways. Immunol Rev 173: 89 \u2013 97.",
      "Merrill AH Sullards MC Wang E Voss KA Riley RT. 2001. Sphingolipid metabolism: Roles in signal transduction and disruption by fumonisins. Environ Health Perspect 109 Suppl. 2: 283 \u2013 289.",
      "Miller TR Delcher AL Salzberg SL Saunders E Detter JC Halden RU. 2010. Genome sequence of the dioxin-mineralizing bacterium Sphingomonas wittichii RW1. J Bacteriol 192: 6101 \u2013 6102.",
      "M\u00f8ller JD Barnes AC Dalsgaard I Ellis AE. 2005. Characterisation of surface blebbing and membrane vesicles produced by Flavobacterium psychrophilum. Dis Aquat Organ 64: 201 \u2013 209.",
      "Nedashkovskaya OI Vancanneyt M Van Trappen S Vandemeulebroecke K Lysenko AM Rohde M Falsen E Frolova GM Mikhailov VV Swings J. 2004. Description of Algoriphagus aquimarinus sp. nov., Algoriphagus chordae sp. nov. and Algoriphagus winogradskyi sp. nov., from sea water and algae, transfer of Hongiella halophila Yi and Chun 2004 to the genus Algoriphagus as Algoriphagus halophilus comb. nov. and emended descriptions of the genera Algoriphagus Bowman,. 2003 and Hongiella Yi and Chun 2004. Int J Syst Evol Microbiol 54 (Pt 5): 1757 \u2013 1764.",
      "Nedashkovskaya O Kim S Vancanneyt M Lysenko A Shin D Park M Lee KH Jung WJ Kalinovskaya NI Mikhailov VV. 2006. Echinicola pacifica gen. nov., sp nov., a novel flexibacterium isolated from the sea urchin Strongylocentrotus intermedius. Int J Syst Evol Microbiol 56: 953 \u2013 958.",
      "Nierman WC Feldblyum TV Laub MT Paulsen IT Nelson KE Eisen JA Heidelberg JF Alley MR Ohta N Maddock JR. 2001. Complete genome sequence of Caulobacter crescentus. Proc Natl Acad Sci U S A 98: 4136 \u2013 4141.",
      "Oh H-M Kang I Yang S-J Jang Y Vergin KL Giovannoni SJ Cho JC. 2011. Complete genome sequence of strain HTCC2170, a novel member of the genus Maribacter in the family Flavobacteriaceae. J Bacteriol 193: 303 \u2013 304.",
      "Olsen I Jantzen E. 2001. Sphingolipids in bacteria and fungi. Anaerobe 7: 103 \u2013 112.",
      "Prieschl EE Baumruker T. 2000. Sphingolipids: Second messengers, mediators and raft constituents in signaling. Immunol Today 21: 555 \u2013 560.",
      "Provasoli L Pintner I. 1980. Bacteria induced polymorphism in an axenic laboratory strain of Ulva lactuca (Chlorophyceae). J Phycol 16: 196 \u2013 201.",
      "Pyne S Pyne NJ. 2000. Sphingosine 1-phosphate signalling in mammalian cells. Biochem J 349 (Pt 2): 385 \u2013 402.",
      "Raj H Maloy S. 1990. Proposal of Cyclobacterium-Marinus gen-nov, comb-nov for a marine bacterium previously assigned to the genus Flectobacillus. Int J Syst Bacteriol 40: 337 \u2013 347.",
      "Roelofs WL. 1995. Chemistry of sex attraction. Proc Natl Acad Sci U S A 92: 44 \u2013 49.",
      "Ruby EG Urbanowski M Campbell J Dunn A Faini M Gunsalus R Lostroh P Lupp C McCann J Millikan D. 2005. Complete genome sequence of Vibrio fischeri: A symbiotic bacterium with pathogenic congeners. Proc Natl Acad Sci U S A 102: 3004 \u2013 3009.",
      "Ruiz-Trillo I Roger AJ Burger G Gray MW Lang BF. 2008. A phylogenomic investigation into the origin of metazoa. Mol Biol Evol 25: 664 \u2013 672.",
      "Saville Kent W. 1880. A manual of the infusoria. David Bogue , London.",
      "Schaefer AL Hanzelka BL Eberhard A Greenberg EP. 1996. Quorum sensing in Vibrio fischeri: Probing autoinducer-LuxR interactions with autoinducer analogs. J Bacteriol 178: 2897 \u2013 2901.",
      "Spiegel S Milstien S. 2000. Sphingosine-1-phosphate: Signaling inside and out. FEBS Lett 476: 55 \u2013 57.",
      "Spizizen J. 1958. Transformation of biochemically deficient strains of Bacillus subtilis by deoxyribonucleate. Proc Natl Acad Sci USA 44: 1072 \u2013 1078.",
      "Takeuchi O Hoshino K Kawai T Sanjo H Takada H Ogawa T Takeda K Akira S. 1999. Differential roles of TLR2 and TLR4 in recognition of gram-negative and gram-positive bacterial cell wall components. Immunity 11: 443 \u2013 451.",
      "Talavera G Castresana J. 2007. Improvement of phylogenies after removing divergent and ambiguously aligned blocks from protein sequence alignments. Syst Biol 56: 564 \u2013 577.",
      "Tiago I Mendes V Pires C Morais PV Ver\u00edssimo A. 2006. Chimaereicella alkaliphila gen. nov., sp. nov., a Gram-negative alkaliphilic bacterium isolated from a nonsaline alkaline groundwater. Syst Appl Microbiol 29: 100 \u2013 108.",
      "Van Trappen S Vandecandelaere I Mergaert J Swings J. 2004. Algoriphagus antarcticus sp. nov., a novel psychrophile from microbial mats in Antarctic lakes. Int J Syst Evol Microbiol 54 (Pt 6): 1969 \u2013 1973.",
      "Webster NS Smith LD Heyward AJ Watts JEM Webb RI Blackall LL Negri AP. 2004. Metamorphosis of a scleractinian coral in response to microbial biofilms. Appl Environ Microbiol 70: 1213 \u2013 1221.",
      "Weisburg WG Barns SM Pelletier DA Lane DJ. 1991. 16S ribosomal DNA amplification for phylogenetic study. J Bacteriol 173: 697 \u2013 703.",
      "Wexler HM. 2007. Bacteroides: The good, the bad, and the nitty-gritty. Clin Microbiol Rev 20: 593 \u2013 621.",
      "Wood DW Setubal JC Kaul R Monks DE Kitajima JP Okura VK Zhou Y Chen L Wood GE Almeida NF Jr. 2001. The genome of the natural genetic engineer Agrobacterium tumefaciens C58. Science 294: 2317 \u2013 2323.",
      "Yi H Chun J. 2004. Hongiella mannitolivorans gen. nov., sp. nov., Hongiella halophila sp. nov. and Hongiella ornithinivorans sp. nov., isolated from tidal flat sediment. Int J Syst Evol Microbiol 54 (Pt 1): 157 \u2013 162.",
      "Yoon J-H Yeo S-H Oh TK. 2004. Hongiella marincola sp. nov., isolated from sea water of the East Sea in Korea. Int J Syst Evol Microbiol 54 (Pt 5): 1845 \u2013 1848.",
      "Yoon J-H Kang S-J Oh TK. 2005a. Algoriphagus locisalis sp. nov., isolated from a marine solar saltern. Int J Syst Evol Microbiol 55 (Pt 4): 1635 \u2013 1639.",
      "Yoon J-H Kang S-J Jung S-Y Lee C-H Oh TK. 2005b. Algoriphagus yeomjeoni sp. nov., isolated from a marine solar saltern in the Yellow Sea, Korea. Int J Syst Evol Microbiol 55 (Pt 2): 865 \u2013 870.",
      "Yoon J-H Lee M-H Kang S-J Oh TK. 2006. Algoriphagus terrigena sp. nov., isolated from soil. Int J Syst Evol Microbiol 56 (Pt 4): 777 \u2013 780.",
      "Zhou L Srisatjaluk R Justus DE Doyle RJ. 1998. On the origin of membrane vesicles in gram-negative bacteria. FEMS Microbiol Lett 163: 223 \u2013 228.",
      "Ziegler TA Forward RB. 2007. Larval release behaviors in the Caribbean spiny lobster, Panulirus argus: Role of peptide pheromones. J Chem Ecol 33: 1795 \u2013 1805."
    ]

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