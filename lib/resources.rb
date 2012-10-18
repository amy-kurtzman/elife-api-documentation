require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'

module GitHub
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        202 => '202 Accepted',
        204 => '204 No Content',
        301 => '301 Moved Permanently',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        409 => '409 Conflict',
        418 => '418 Im a teapot',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      AUTHORS = {
        :technoweenie => '821395fe70906c8290df7f18ac4ac6cf'
      }

      DefaultTimeFormat = "%B %-d, %Y".freeze

      def post_date(item)
        strftime item[:created_at]
      end

      def strftime(time, format = DefaultTimeFormat)
        attribute_to_time(time).strftime(format)
      end

      def gravatar_for(login)
        %(<img height="16" width="16" src="%s" />) % gravatar_url_for(login)
      end

      def gravatar_url_for(login)
        md5 = AUTHORS[login.to_sym]
        default = "https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
        "https://secure.gravatar.com/avatar/%s?s=20&d=%s" %
          [md5, default]
      end

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <https://api.github.com/resource?page=2>; rel="next",'
              lines << '      <https://api.github.com/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        #lines << "X-RateLimit-Limit: 5000"
        #lines << "X-RateLimit-Remaining: 4999"

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="language-javascript">) +
          JSON.pretty_generate(hash) + "</code></pre>"
      end

      def text_html(response, status, head = {})
        hs = headers(status, head.merge('Content-Type' => 'text/html'))
        res = CGI.escapeHTML(response)
        hs + %(<pre class="highlight"><code>) + res + "</code></pre>"
      end
    end

    USER = {
      "login"        => "octocat",
      "id"           => 1,
      "avatar_url"   => "https://github.com/images/error/octocat_happy.gif",
      "gravatar_id"  => "somehexcode",
      "url"          => "https://api.github.com/users/octocat"
    }

    CONTRIBUTOR = USER.merge({
      "contributions" => 32
    })

    ELIFE_PERSON = USER.merge({
     "elife_profile_id"  =>   "uid of elife person",         
     "last_updated"  =>     "last date this person was updated",   
     "ORCID"  =>       2342,       
     "first_nm"  =>       "Jim",    
     "middle_nm"  =>      "Badielle",   
     "profile_text"  =>     "description of the researcher",
     "profile_image"  =>    "binary blob containing encoded image",
     "current_editorial_role"  =>   "current editorial role of the researcher",
     "editorial_tenure_history"  =>  "editorial roles held in the past", 
     "is_named_reviewer"  =>  "whehter person has signed a review, defaults the FALSE", 
     "is_author"  =>      true,  
     "current_affiliation"  =>    "current value held for author affiliation",   
     "past_affilitations"  =>   "record of previous affiliations for a person",  
     "profile_subjects"  =>   "subjects listed against a persons profile in EJP",  
     "published_subjects"  =>   "subjects held against a persons publications in EJP", 
     "funding_sources"  =>  "names of institutions funding this person", 
     "authored_papers"  =>  "doi records of papers authored by this person", 
     "co_authors"  =>   "elife_profile_id records of other pepople who have authord with this person, and papers they have coauthored", 
     "named_reviewer_on"  =>  "dois of papers that this person has signed a review for", 
     "handling_editor_on"  =>  "dois of papers that this person was the handling editor for",
     "is_alive"  =>   true  
    })

    FLUIDINFO_NULL = USER.merge({"results"=>{"id"=>{"3300de84-bb5e-4523-b722-a28e8062eeff"=>{"ianmulvany/elifepeople/elife_profile_id"=>{"value"=>"1464", "username"=>"ianmulvany", "updated-at"=>"2012-09-20T16:48:47.003319"}}, "b7738355-6f88-4308-84c9-ac3f7d9b14fb"=>{"ianmulvany/elifepeople/elife_profile_id"=>{"value"=>"1015", "username"=>"ianmulvany", "updated-at"=>"2012-09-20T16:48:49.956051"}}, "fd2ce06c-f6f0-4b0d-9c24-ff01160f5443"=>{"ianmulvany/elifepeople/elife_profile_id"=>{"value"=>"1001", "username"=>"ianmulvany", "updated-at"=>"2012-09-20T10:29:45.645736"}}}}})

    FULL_USER = USER.merge({
      "name"         => "monalisa octocat",
      "company"      => "GitHub",
      "blog"         => "https://github.com/blog",
      "location"     => "San Francisco",
      "email"        => "octocat@github.com",
      "hireable"     => false,
      "bio"          => "There once was...",
      "public_repos" => 2,
      "public_gists" => 1,
      "followers"    => 20,
      "following"    => 0,
      "html_url"     => "https://github.com/octocat",
      "created_at"   => "2008-01-14T04:33:35Z",
      "type"         => "User"
    })

    PRIVATE_USER = FULL_USER.merge({
      "total_private_repos" => 100,
      "owned_private_repos" => 100,
      "private_gists"       => 81,
      "disk_usage"          => 10000,
      "collaborators"       => 8,
      "plan"                => {
        "name"          => "Medium",
        "space"         => 400,
        "collaborators" => 10,
        "private_repos" => 20
      }
    })

    FLUIDINFO_GET_OBJECTS_BY_ARTICLE_DOI = {
      "ids" => ["71e9f5be-56a1-4e5a-a04a-35d2cfc75145", "0c0e0ea4-1530-441a-bb97-9d26ebf65647", "749f6115-0848-4f59-9b52-adbc461c8ced", "82aba95e-100e-468a-b5c4-4457ae69d215", "55decf52-a0d9-42d2-8db9-d5924a40a57a", "337aa9e5-0c48-422b-945a-be12353f6fe2", "eb275979-d99d-4e44-a84f-15ce912ca888", "b55573b5-d12a-4604-b7eb-5f06ff1a94ef", "fd6804e2-70be-4ced-a896-9e153bacada7"]
    }
    
    FLUIDINFO_GET_VALUES_BY_FLUIDDB_ID = {
      "results" =>
        {"id" => {"eb275979-d99d-4e44-a84f-15ce912ca888" =>
              {"elifesciences.org/api_v1/article/article_title" =>
                  {"username" => "elifesciences.org", "updated-at" => "2012-10-08T22:43:26.470758", "value" => "A bacterial sulfonolipid triggers multicellular development in the closest living relatives of animals"}}}}}

    FLUIDINFO_GET_NAMESPACE_ARTICLE = {
        "tagNames" => ["doi_url", "publisher", "subject_area", "keywords", "received_date_day", "pmid", "abstract", "pub_date_day", "received_date_year", "accepted_date_timestamp", "copyright_holder", "journal_issn_ppub", "pub_date_timestamp", "accepted_date_day", "award_group_award_id", "license", "conflict", "article_institution", "correspondence", "received_date_date", "accepted_date_month", "copyright_year", "license_type", "refs", "journal_id", "pub_date_month", "received_date_timestamp", "ack", "journal_title", "article_type", "authors", "pub_date_year", "accepted_date_date", "copyright_statement", "article_title", "research_organism", "pub_date_date", "received_date_month", "funding_statement", "license_url", "doi", "journal_issn_epub", "article_country", "author_notes", "accepted_date_year", "award_group_funding_source", "award_group_principle_award_recipient", "components"],
        "id" => "e6ee161d-6dbc-4209-86bb-677431be0ac8"
}

    FLUIDINFO_GET_OBJECTS_EB275979 = {
      "tagPaths" => ["elifesciences.org/api_v1/article/copyright_year", "elifesciences.org/api_v1/article/accepted_date_day", "elifesciences.org/api_v1/article/received_date_day", "elifesciences.org/api_v1/article/pub_date_day", "elifesciences.org/api_v1/article/journal_issn_epub", "elifesciences.org/api_v1/article/subject_area", "elifesciences.org/api_v1/article/journal_title", "elifesciences.org/api_v1/article/abstract", "elifesciences.org/api_v1/article/pub_date_timestamp", "elifesciences.org/api_v1/article/pub_date_month", "elifesciences.org/api_v1/article/received_date_month", "elifesciences.org/api_v1/article/received_date_timestamp", "elifesciences.org/api_v1/article/received_date_date", "elifesciences.org/api_v1/article/refs", "elifesciences.org/api_v1/article/accepted_date_date", "elifesciences.org/api_v1/article/pub_date_date", "elifesciences.org/api_v1/article/award_group_funding_source", "elifesciences.org/api_v1/article/funding_statement", "elifesciences.org/api_v1/article/doi_url", "elifesciences.org/api_v1/article/keywords", "elifesciences.org/api_v1/article/research_organism", "elifesciences.org/api_v1/article/components", "elifesciences.org/api_v1/article/award_group_principle_award_recipient", "elifesciences.org/api_v1/article/accepted_date_year", "elifesciences.org/api_v1/article/award_group_award_id", "elifesciences.org/api_v1/article/copyright_holder", "elifesciences.org/api_v1/article/article_type", "elifesciences.org/api_v1/article/ack", "elifesciences.org/api_v1/article/copyright_statement", "elifesciences.org/api_v1/article/accepted_date_month", "elifesciences.org/api_v1/article/accepted_date_timestamp", "elifesciences.org/api_v1/article/conflict", "elifesciences.org/api_v1/article/received_date_year", "elifesciences.org/api_v1/article/author_notes", "elifesciences.org/api_v1/article/license_type", "elifesciences.org/api_v1/article/license", "elifesciences.org/api_v1/article/license_url", "elifesciences.org/api_v1/article/pub_date_year", "elifesciences.org/api_v1/article/correspondence", "elifesciences.org/api_v1/article/article_title", "elifesciences.org/api_v1/article/publisher", "elifesciences.org/api_v1/article/authors", "elifesciences.org/api_v1/article/doi", "fluiddb/about"]
      }

    FLUIDINFO_GET_VALUES_BY_ARTICLE_DOI_00013 = {
      "results"=>{"id"=>{"eb275979-d99d-4e44-a84f-15ce912ca888"=>{"elifesciences.org/api_v1/article/doi"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"10.7554/eLife.00013"}, "fluiddb/about"=>{"username"=>"fluiddb", "updated-at"=>"2012-10-08T17:35:22.902590", "value"=>"http://dx.doi.org/10.7554/eLife.00013"}, "elifesciences.org/api_v1/article/authors"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>["Rosanna A Alegado", "Laura W Brown", "Shugeng Cao", "Renee K Dermenjian", "Richard Zuzow", "Stephen R Fairclough", "Jon Clardy", "Nicole King"]}, "elifesciences.org/api_v1/article/received_date_month"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"05"}, "elifesciences.org/api_v1/article/publisher"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"eLife Sciences Publications, Ltd"}, "elifesciences.org/api_v1/article/article_title"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"A bacterial sulfonolipid triggers multicellular development in the closest living relatives of animals"}, "elifesciences.org/api_v1/article/correspondence"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"*For correspondence: jon_clardy@hms.harvard.edu (JC); nking@berkeley.edu (NK)"}, "elifesciences.org/api_v1/article/pub_date_year"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"2012"}, "elifesciences.org/api_v1/article/license_url"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"http://creativecommons.org/licenses/by/3.0/"}, "elifesciences.org/api_v1/article/license"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"This article is distributed under the terms of the Creative Commons Attribution License, which permits unrestricted use and redistribution provided that the original author and source are credited."}, "elifesciences.org/api_v1/article/license_type"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"open-access"}, "elifesciences.org/api_v1/article/author_notes"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"†These authors contributed equally to this work."}, "elifesciences.org/api_v1/article/received_date_year"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"2012"}, "elifesciences.org/api_v1/article/funding_statement"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"The funders had no role in study design, data collection and interpretation, or the decision to submit the work for publication."}, "elifesciences.org/api_v1/article/accepted_date_month"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"07"}, "elifesciences.org/api_v1/article/copyright_statement"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"Copyright © 2012, Alegado et al"}, "elifesciences.org/api_v1/article/article_type"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"research-article"}, "elifesciences.org/api_v1/article/copyright_holder"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"Alegado et al"}, "elifesciences.org/api_v1/article/award_group_award_id"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"F32 GM086054"}, "elifesciences.org/api_v1/article/accepted_date_year"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"2012"}, "elifesciences.org/api_v1/article/award_group_principle_award_recipient"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"Nicole King"}, "elifesciences.org/api_v1/article/components"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>["http://dx.doi.org/10.7554/eLife.00013.001", "http://dx.doi.org/10.7554/eLife.00013.002", "http://dx.doi.org/10.7554/eLife.00013.003", "http://dx.doi.org/10.7554/eLife.00013.004", "http://dx.doi.org/10.7554/eLife.00013.005", "http://dx.doi.org/10.7554/eLife.00013.006", "http://dx.doi.org/10.7554/eLife.00013.007", "http://dx.doi.org/10.7554/eLife.00013.008", "http://dx.doi.org/10.7554/eLife.00013.009", "http://dx.doi.org/10.7554/eLife.00013.010", "http://dx.doi.org/10.7554/eLife.00013.011", "http://dx.doi.org/10.7554/eLife.00013.012", "http://dx.doi.org/10.7554/eLife.00013.013", "http://dx.doi.org/10.7554/eLife.00013.014", "http://dx.doi.org/10.7554/eLife.00013.015", "http://dx.doi.org/10.7554/eLife.00013.016", "http://dx.doi.org/10.7554/eLife.00013.017", "http://dx.doi.org/10.7554/eLife.00013.018", "http://dx.doi.org/10.7554/eLife.00013.019", "http://dx.doi.org/10.7554/eLife.00013.020", "http://dx.doi.org/10.7554/eLife.00013.021", "http://dx.doi.org/10.7554/eLife.00013.022", "http://dx.doi.org/10.7554/eLife.00013.023", "http://dx.doi.org/10.7554/eLife.00013.024", "http://dx.doi.org/10.7554/eLife.00013.025", "http://dx.doi.org/10.7554/eLife.00013.026", "http://dx.doi.org/10.7554/eLife.00013.027", "http://dx.doi.org/10.7554/eLife.00013.028", "http://dx.doi.org/10.7554/eLife.00013.029", "http://dx.doi.org/10.7554/eLife.00013.030"]}, "elifesciences.org/api_v1/article/research_organism"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"Other"}, "elifesciences.org/api_v1/article/keywords"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>["Salpingoeca rosetta", "Algoriphagus", "bacterial sulfonolipid", "multicellular development"]}, "elifesciences.org/api_v1/article/doi_url"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"http://dx.doi.org/10.7554/eLife.00013"}, "elifesciences.org/api_v1/article/conflict"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"The remaining authors have no competing interests to declare."}, "elifesciences.org/api_v1/article/award_group_funding_source"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"Gordon and Betty Moore Foundation Marine Microbiology Initiative"}, "elifesciences.org/api_v1/article/pub_date_date"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"October 10, 2012"}, "elifesciences.org/api_v1/article/accepted_date_date"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"July 18, 2012"}, "elifesciences.org/api_v1/article/refs"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>["AgostaWC. 1992. Chemical communication. Scientific American Press, New York.", "AhmedIYokotaAFujiwaraT. 2007. Chimaereicella boritolerans sp nov., a boron-tolerant and alkaliphilic bacterium of the family Flavobacteriaceae isolated from soil. Int J Syst Evol Microbiol 57: 986–992.", "AlegadoRAGrabenstatterJDZuzowRMorrisAHuangSYSummonsREKingN. 2012. Algoriphagus machipongonensis sp. nov. co-isolated with a colonial choanoflagellate. Int J Syst Evol Microbiol [epub ahead of print].", "AnDNaCBielawskiJHannunYAKasperDL. 2011. Membrane sphingolipids as essential molecular signals for Bacteroides survival in the intestine. Proc Natl Acad Sci U S A 108 Suppl. 1: 4666–4671.", "AntonJOrenABenllochSRodriguez-ValeraFAmannRRossello-MoraR. 2002. Salinibacter ruber gen. nov., sp nov., a novel, extremely halophilic member of the bacteria from saltern crystallizer ponds. Int J Syst Evol Microbiol 52: 485–491.", "ApicellaMA. 2008. Isolation and characterization of lipopolysaccharides. Methods Mol Biol 431: 3–13.", "AtlasRM. 2004. Handbook of microbiological media, p.2051. Boca Raton: CRC.", "BarbeyronTL’HaridonSCorreEKloaregBPotinP. 2001. Zobellia galactanovorans gen. nov., sp. nov., a marine species of Flavobacteriaceae isolated from a red alga, and classification of [Cytophaga] uliginosa (ZoBell and Upham 1944) Reichenbach 1989 as Zobellia uliginosa gen. nov., comb. nov. Int J Syst Evol Microbiol 51(Pt 3): 985–997.", "BernardetJSegersPVancanneytMBertheFKerstersKVandammeP. 1996. Cutting a Gordian knot: Emended classification and description of the genus Flavobacterium, emended description of the family Flavobacteriaceae, and proposal of Flavobacterium hydatis nom nov (basonym, Cytophaga aquatilis Strohl and Tait 1978). Int J Syst Bacteriol 46: 128–148.", "BlattnerFRPlankettGIIIBlochCAPernaNBurlandVRileyMCollado-VidesJGlasnerJDRodeCKMayhewGF. 1997. The complete genome sequence of Escherichia coli K-12. Science 277: 1453–1462.", "BlighEGDyerWJ. 1959. A rapid method of total lipid extraction and purification. Can J Biochem Physiol 37: 911–917.", "BowmanJPNicholsCMGibsonJAE. 2003. Algoriphagus ratkowskyi gen. nov., sp. nov., Brumimicrobium glaciale gen. nov., sp. nov., Cryomorpha ignava gen. nov., sp. nov. and Crocinitomix catalasitica gen. nov., sp. nov., novel flavobacteria isolated from various polar habitats. Int J Syst Evol Microbiol 53(Pt 5): 1343–1355.", "BradleyRKRobertsASmootMJuvekarSDoJDeweyCHolmesIPachterL. 2009. Fast statistical alignment. PLoS Comput Biol 5: e1000392.", "BrettarIChristenRHofleM. 2004a. Aquiflexum balticum gen. nov., sp nov., a novel marine bacterium of the Cytophaga-Flavobacterium-Bacteroides group isolated from surface water of the central Baltic Sea. Int J Syst Evol Microbiol 54: 2335–2341.", "BrettarIChristenRHofleMG. 2004b. Belliella baltica gen. nov., sp. nov., a novel marine bacterium of the Cytophaga-Flavobacterium-Bacteroides group isolated from surface water of the central Baltic Sea. Int J Syst Evol Microbiol 54(Pt 1): 65–70.", "BurkholderPRGilesNH. 1947. Induced biochemical mutations in Bacillus subtilis. Am J Bot 34: 345–348.", "ButenandtABeckmannRHeckerE. 1961. On the sex attractant of silk-moths. I. The biological test and the isolation of the pure sex-attractant bombykol. Hoppe-Seylers Z Physiol Chem 324: 71–83.", "CarlucciAFPramerD. 1957. Factors influencing the plate method for determining abundance of bacteria in sea water. Proc Soc Exp Biol Med 96: 392–394.", "CarrMLeadbeaterBSCHassanRNelsonMBaldaufSL. 2008. Molecular phylogeny of choanoflagellates, the sister group to Metazoa. Proc Natl Acad Sci U S A 105: 16641–16646.", "CastresanaJ. 2000. Selection of conserved blocks from multiple alignments for their use in phylogenetic analysis. Mol Biol Evol 17: 540–552.", "Cerdeno-TarragaAMPatrickSCrossmanLBlakelyGWAbrattVLennardNPoxtonIDuerdenBHarrisBQuailMA. 2005. Extensive DNA inversions in the B. fragilis genome control variable gene expression.BlakelyGW, editor. Science 307: 1463–1465.", "CheliusMTriplettE. 2000. Dyadobacter fermentans gen. nov., sp nov., a novel gram-negative bacterium isolated from surface-sterilized Zea mays stems. Int J Syst Evol Microbiol 50: 751–758.", "ChoJ-CGiovannoniSJ. 2003. Croceibacter atlanticus gen. nov., sp. nov., a novel marine bacterium in the family Flavobacteriaceae. Syst Appl Microbiol 26: 76–83.", "ChoJ-CGiovannoniSJ. 2004. Robiginitalea biformata gen. nov., sp. nov., a novel marine bacterium in the family Flavobacteriaceae with a higher G+C content. Int J Syst Evol Microbiol 54(Pt 4): 1101–1106.", "CohnZAMorseSI. 1960. Functional and metabolic properties of polymorphonuclear leucocytes. II. The influence of a lipopolysaccharide endotoxin. J Exp Med 111: 689–704.", "DayelMJAlegadoRAFaircloughSRLevinTCNicholsSAMcDonaldKKingN. 2011. Cell differentiation and morphogenesis in the colony-forming choanoflagellate Salpingoeca rosetta. Dev Biol 357: 73–82.", "DeSantisTZHugenholtzPLarsenNRojasMBrodieELKellerKHuberTDaleviDHuPAndersenGL. 2006. Greengenes, a chimera-checked 16S rRNA gene database and workbench compatible with ARB. Appl Environ Microbiol 72: 5069–5072.", "DesbrossesGJStougaardJ. 2011. Root nodulation: A paradigm for how plant-microbe symbiosis influences host developmental pathways. Cell Host Microbe 10: 348–358.", "DrijberRMcGillW. 1994. Sulfonolipid content of Cytophaga and Flexibacter species isolated from soil and cultured under different nutrient and temperature regimes. Can J Microbiol 40: 132–139.", "EdmanDCPollockMBHallER. 1968. Listeria monocytogenes L forms. I. Induction maintenance, and biological characteristics. J Bacteriol 96: 352–357.", "FaircloughSRDayelMJKingN. 2010. Multicellular development in a choanoflagellate. Curr Biol 20: R875–R876.", "FalensteinJ. 1989. PHYLIP—Phylogeny inference packages (version 3.2). Cladistics. 5: 164–166.", "FalkeJJBassRBButlerSLChervitzSADanielsonMA. 1997. The two-component signaling pathway of bacterial chemotaxis: A molecular view of signal transduction by receptors, kinases, and adaptation enzymes. Annu Rev Cell Dev Biol 13: 457–512.", "FalkowS. 2006. Is persistent bacterial infection good for your health? Cell 124: 699–702.", "GarrityGM. 2010. Bergey’s manual of systematic bacteriology: Bacteroidetes, spirochetes, tenericutes (mollicutes), acidobacteria, fibrobacteres, fusobacteria, dictyoglomi, gemmatimonadetes, lentisphaerae, verrucomicrobia, chlamydiae, and planctomycetes, p.949. New York: Springer Verlag.", "GodchauxWLeadbetterER. 1980. Capnocytophaga spp. contain sulfonolipids that are novel in procaryotes. J Bacteriol 144: 592–602.", "GodchauxWLeadbetterER. 1983. Unusual sulfonolipids are characteristic of the Cytophaga-Flexibacter group. J Bacteriol 153: 1238–1246.", "GodchauxWLeadbetterER. 1984. Sulfonolipids of gliding bacteria. Structure of the N-acylaminosulfonates. J Biol Chem 259: 2982–2990.", "GodchauxWLeadbetterE. 1988. Sulfonolipids are localized in the outer membrane of the gliding bacterium Cytophaga johnsonae. Arch Microbiol 150: 42–47.", "HannichJTUmebayashiKRiezmanH. 2011. Distribution and functions of sterols and sphingolipids. Cold Spring Harb Perspect Biol 3: pii: a004762. doi: 10.1101/cshperspect.a004762.", "HannunYALubertoCArgravesKM. 2001. Enzymes of sphingolipid metabolism: From modular to integrative signaling. Biochemistry 40: 4893–4903.", "HerrDRFyrstHPhanVHeineckeKGeorgesRHarrisGLSabaJD. 2003. Sply regulation of sphingolipid signaling molecules is essential for Drosophila development. Development 130: 2443–2453.", "HibberdDJ. 1975. Observations on the ultrastructure of the choanoflagellate Codosiga botrytis (Ehr.) Saville-Kent with special reference to the flagellar apparatus. J Cell Sci 17: 191–219.", "HoffmannJAKafatosFCJanewayCAEzekowitzRA. 1999. Phylogenetic perspectives in innate immunity. Science 284: 1313–1318.", "HughesDTSperandioV. 2008. Inter-kingdom signalling: Communication between bacteria and their hosts. Nat Rev Microbiol 6: 111–120.", "James-ClarkH. 1867. On the spongiae ciliatae as infusoria flagellata; or observations on the structure, animality, and relationship of Leucosolenia botryoides, Bowerbank.Memoirs Boston Soc. Of Nat. Hist. I, two plates.", "de JongeBLChangYSGageDTomaszA. 1992. Peptidoglycan composition in heterogeneous Tn551 mutants of a methicillin-resistant Staphylococcus aureus strain. J Biol Chem 267: 11255–11259.", "KamiyamaTUminoTItezonoYNakamuraYSatohTYokoseK. 1995a. Sulfobacins A and B, novel von Willebrand factor receptor antagonists. II. Structural elucidation. J Antibiot 48: 929–936.", "KamiyamaTUminoTSatohTSawairiSShiraneMOhshimaSYokoseK. 1995b. Sulfobacins A and B, novel von Willebrand factor receptor antagonists. I. Production, isolation, characterization and biological activities. J. Antibiot 48: 924–928.", "KarpovSACoupeSJ. 1998. A revision of choanoflagellate genera Kentrosiga, Schiller, 1953 and Desmarella, Kent, 1880. Acta Protozoologica 37: 23–27.", "KimbrellDABeutlerB. 2001. The evolution and genetics of innate immunity. Nat Rev Genet 2: 256–267.", "KingN. 2004. The unicellular ancestry of animal development. Dev Cell 7: 313–325.", "KingNCarrollSB. 2001. A receptor tyrosine kinase from choanoflagellates: Molecular insights into early animal evolution. Proc Natl Acad Sci U S A 98: 15032–15037.", "KingNHittingerCTCarrollSB. 2003. Evolution of key cell signaling and adhesion protein families predates animal origins. Science 301: 361–363.", "KingNWestbrookMJYoungSLKuoAAbedinMChapmanJFaircloughSHellstenUIsogaiY. 2008. The genome of the choanoflagellate Monosiga brevicollis and the origin of metazoans. Nature 451: 783–788.", "KingNYoungSLAbedinMCarrMLeadbeaterBSC. 2009. Starting and maintaining Monosiga brevicollis cultures. Cold Spring Harb Protoc. 2009: pdb.prot5148.", "KobayashiJMikamiSShigemoriHTakaoTYSIzutaSYoshidaS. 1995. Flavocristamides A and B, new DNA polymerase α inhibitors from a marine bacterium sp. Tetrahedron 51: 10487–10490.", "KoppEBMedzhitovR. 1999. The Toll-receptor family and control of innate immunity. Curr Opin Immunol 11: 13–18.", "KoropatnickTAEngleJTApicellaMAStabbEVGoldmanWEMcfall-NgaiMJ. 2004. Microbial factor-mediated development in a host-bacterial mutualism. Science 306: 1186–1188.", "KreftJM. 2010. Effects of forming multicellular colonies or attaching to surfaces on feeding rates of the choanoflagellate Salpingoeca rosetta. KoehlM, editor. Thesis (M.A. in Integrative Biology). University of California, Berkeley.", "KunstFOgasawaraNMoszerIAlbertiniAMAlloniGAzevedoVBerteroMGBessièresPBolotinABorchertS. 1997. The complete genome sequence of the gram-positive bacterium Bacillus subtilis. Nature 390: 249–256.", "LeadbeaterBSC. 1983. Life-history and ultrastructure of a new marine species of Proterospongia (Choanoflagellida). J Mar Biol Assoc UK 63: 135–160.", "LeeYKMazmanianSK. 2010. Has the microbiota played a critical role in the evolution of the adaptive immune system? Science 330: 1768–1773.", "LewinR. 1969. A classification of flexibacteria. J Gen Microbiol 58: 189–206.", "MatsunagaTOkamuraYFukudaYWahyudiATMuraseYTakeyamaH. 2005. Complete genome sequence of the facultative anaerobic magnetotactic bacterium Magnetospirillum sp. strain AMB-1. DNA Res 12: 157–166.", "MatsuoYSuzukiMKasaiHShizuriYHarayamaS. 2003. Isolation and phylogenetic characterization of bacteria capable of inducing differentiation in the green alga Monostroma oxyspermum. Environ Microbiol 5: 25–35.", "MatsuoYImagawaHNishizawaMShizuriY. 2005. Isolation of an algal morphogenesis inducer from a marine bacterium. Science 307: 1598.", "MazmanianSKLiuCHTzianabosAOKasperDL. 2005. An immunomodulatory molecule of symbiotic bacteria directs maturation of the host immune system. Cell 122: 107–118.", "MazmanianSKRoundJLKasperDL. 2008. A microbial symbiosis factor prevents intestinal inflammatory disease. Nature 453: 620–625.", "McFall-NgaiM. 1999. Consequences of evolving with bacterial symbionts: Insights from the squid-vibrio associations. Ann Rev Ecol Syst 30: 235–256.", "MedzhitovRJanewayC. 2000. Innate immune recognition: Mechanisms and pathways. Immunol Rev 173: 89–97.", "MerrillAHSullardsMCWangEVossKARileyRT. 2001. Sphingolipid metabolism: Roles in signal transduction and disruption by fumonisins. Environ Health Perspect109 Suppl. 2: 283–289.", "MillerTRDelcherALSalzbergSLSaundersEDetterJCHaldenRU. 2010. Genome sequence of the dioxin-mineralizing bacterium Sphingomonas wittichii RW1. J Bacteriol 192: 6101–6102.", "MøllerJDBarnesACDalsgaardIEllisAE. 2005. Characterisation of surface blebbing and membrane vesicles produced by Flavobacterium psychrophilum. Dis Aquat Organ 64: 201–209.", "NedashkovskayaOIVancanneytMVan TrappenSVandemeulebroeckeKLysenkoAMRohdeMFalsenEFrolovaGMMikhailovVVSwingsJ. 2004. Description of Algoriphagus aquimarinus sp. nov., Algoriphagus chordae sp. nov. and Algoriphagus winogradskyi sp. nov., from sea water and algae, transfer of Hongiella halophila Yi and Chun 2004 to the genus Algoriphagus as Algoriphagus halophilus comb. nov. and emended descriptions of the genera Algoriphagus Bowman,. 2003 and Hongiella Yi and Chun 2004. Int J Syst Evol Microbiol 54(Pt 5): 1757–1764.", "NedashkovskayaOKimSVancanneytMLysenkoAShinDParkMLeeKHJungWJKalinovskayaNIMikhailovVV. 2006. Echinicola pacifica gen. nov., sp nov., a novel flexibacterium isolated from the sea urchin Strongylocentrotus intermedius. Int J Syst Evol Microbiol 56: 953–958.", "NiermanWCFeldblyumTVLaubMTPaulsenITNelsonKEEisenJAHeidelbergJFAlleyMROhtaNMaddockJR. 2001. Complete genome sequence of Caulobacter crescentus. Proc Natl Acad Sci U S A 98: 4136–4141.", "OhH-MKangIYangS-JJangYVerginKLGiovannoniSJChoJC. 2011. Complete genome sequence of strain HTCC2170, a novel member of the genus Maribacter in the family Flavobacteriaceae. J Bacteriol 193: 303–304.", "OlsenIJantzenE. 2001. Sphingolipids in bacteria and fungi. Anaerobe 7: 103–112.", "PrieschlEEBaumrukerT. 2000. Sphingolipids: Second messengers, mediators and raft constituents in signaling. Immunol Today 21: 555–560.", "ProvasoliLPintnerI. 1980. Bacteria induced polymorphism in an axenic laboratory strain of Ulva lactuca (Chlorophyceae). J Phycol 16: 196–201.", "PyneSPyneNJ. 2000. Sphingosine 1-phosphate signalling in mammalian cells. Biochem J 349(Pt 2): 385–402.", "RajHMaloyS. 1990. Proposal of Cyclobacterium-Marinus gen-nov, comb-nov for a marine bacterium previously assigned to the genus Flectobacillus. Int J Syst Bacteriol 40: 337–347.", "RoelofsWL. 1995. Chemistry of sex attraction. Proc Natl Acad Sci U S A 92: 44–49.", "RubyEGUrbanowskiMCampbellJDunnAFainiMGunsalusRLostrohPLuppCMcCannJMillikanD. 2005. Complete genome sequence of Vibrio fischeri: A symbiotic bacterium with pathogenic congeners. Proc Natl Acad Sci U S A 102: 3004–3009.", "Ruiz-TrilloIRogerAJBurgerGGrayMWLangBF. 2008. A phylogenomic investigation into the origin of metazoa. Mol Biol Evol 25: 664–672.", "Saville KentW. 1880. A manual of the infusoria. David Bogue, London.", "SchaeferALHanzelkaBLEberhardAGreenbergEP. 1996. Quorum sensing in Vibrio fischeri: Probing autoinducer-LuxR interactions with autoinducer analogs. J Bacteriol 178: 2897–2901.", "SpiegelSMilstienS. 2000. Sphingosine-1-phosphate: Signaling inside and out. FEBS Lett 476: 55–57.", "SpizizenJ. 1958. Transformation of biochemically deficient strains of Bacillus subtilis by deoxyribonucleate. Proc Natl Acad Sci USA 44: 1072–1078.", "TakeuchiOHoshinoKKawaiTSanjoHTakadaHOgawaTTakedaKAkiraS. 1999. Differential roles of TLR2 and TLR4 in recognition of gram-negative and gram-positive bacterial cell wall components. Immunity 11: 443–451.", "TalaveraGCastresanaJ. 2007. Improvement of phylogenies after removing divergent and ambiguously aligned blocks from protein sequence alignments. Syst Biol 56: 564–577.", "TiagoIMendesVPiresCMoraisPVVeríssimoA. 2006. Chimaereicella alkaliphila gen. nov., sp. nov., a Gram-negative alkaliphilic bacterium isolated from a nonsaline alkaline groundwater. Syst Appl Microbiol 29: 100–108.", "Van TrappenSVandecandelaereIMergaertJSwingsJ. 2004. Algoriphagus antarcticus sp. nov., a novel psychrophile from microbial mats in Antarctic lakes. Int J Syst Evol Microbiol 54(Pt 6): 1969–1973.", "WebsterNSSmithLDHeywardAJWattsJEMWebbRIBlackallLLNegriAP. 2004. Metamorphosis of a scleractinian coral in response to microbial biofilms. Appl Environ Microbiol 70: 1213–1221.", "WeisburgWGBarnsSMPelletierDALaneDJ. 1991. 16S ribosomal DNA amplification for phylogenetic study. J Bacteriol 173: 697–703.", "WexlerHM. 2007. Bacteroides: The good, the bad, and the nitty-gritty. Clin Microbiol Rev 20: 593–621.", "WoodDWSetubalJCKaulRMonksDEKitajimaJPOkuraVKZhouYChenLWoodGEAlmeidaNFJr. 2001. The genome of the natural genetic engineer Agrobacterium tumefaciens C58. Science 294: 2317–2323.", "YiHChunJ. 2004. Hongiella mannitolivorans gen. nov., sp. nov., Hongiella halophila sp. nov. and Hongiella ornithinivorans sp. nov., isolated from tidal flat sediment. Int J Syst Evol Microbiol 54(Pt 1): 157–162.", "YoonJ-HYeoS-HOhTK. 2004. Hongiella marincola sp. nov., isolated from sea water of the East Sea in Korea. Int J Syst Evol Microbiol 54(Pt 5): 1845–1848.", "YoonJ-HKangS-JOhTK. 2005a. Algoriphagus locisalis sp. nov., isolated from a marine solar saltern. Int J Syst Evol Microbiol 55(Pt 4): 1635–1639.", "YoonJ-HKangS-JJungS-YLeeC-HOhTK. 2005b. Algoriphagus yeomjeoni sp. nov., isolated from a marine solar saltern in the Yellow Sea, Korea. Int J Syst Evol Microbiol 55(Pt 2): 865–870.", "YoonJ-HLeeM-HKangS-JOhTK. 2006. Algoriphagus terrigena sp. nov., isolated from soil. Int J Syst Evol Microbiol 56(Pt 4): 777–780.", "ZhouLSrisatjalukRJustusDEDoyleRJ. 1998. On the origin of membrane vesicles in gram-negative bacteria. FEMS Microbiol Lett 163: 223–228.", "ZieglerTAForwardRB. 2007. Larval release behaviors in the Caribbean spiny lobster, Panulirus argus: Role of peptide pheromones. J Chem Ecol 33: 1795–1805."]}, "elifesciences.org/api_v1/article/received_date_date"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"May 22, 2012"}, "elifesciences.org/api_v1/article/received_date_timestamp"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>1337644800}, "elifesciences.org/api_v1/article/accepted_date_timestamp"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>1342569600}, "elifesciences.org/api_v1/article/pub_date_month"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"10"}, "elifesciences.org/api_v1/article/pub_date_timestamp"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>1349827200}, "elifesciences.org/api_v1/article/accepted_date_day"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"18"}, "elifesciences.org/api_v1/article/abstract"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"Bacterially-produced small molecules exert profound influences on animal health, morphogenesis, and evolution through poorly understood mechanisms. In one of the closest living relatives of animals, the choanoflagellate Salpingoeca rosetta, we find that rosette colony development is induced by the prey bacterium Algoriphagus machipongonensis and its close relatives in the Bacteroidetes phylum. Here we show that a rosette inducing factor (RIF-1) produced by A. machipongonensis belongs to the small class of sulfonolipids, obscure relatives of the better known sphingolipids that play important roles in signal transmission in plants, animals, and fungi. RIF-1 has extraordinary potency (femtomolar, or 10−15 M) and S. rosetta can respond to it over a broad dynamic range—nine orders of magnitude. This study provides a prototypical example of bacterial sulfonolipids triggering eukaryotic morphogenesis and suggests molecular mechanisms through which bacteria may have contributed to the evolution of animals."}, "elifesciences.org/api_v1/article/journal_title"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"eLife"}, "elifesciences.org/api_v1/article/subject_area"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>["Research article", "Cell biology"]}, "elifesciences.org/api_v1/article/journal_issn_epub"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"2050-084X"}, "elifesciences.org/api_v1/article/pub_date_day"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"10"}, "elifesciences.org/api_v1/article/received_date_day"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"22"}, "elifesciences.org/api_v1/article/ack"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"AcknowledgementsWe thank Michael Fischbach, Richard Losick, and Russell Vance for critical reading of the manuscript. NK is a Fellow in the Integrated Microbial Biodiversity Program of the Canadian Institute for Advanced Research."}, "elifesciences.org/api_v1/article/copyright_year"=>{"username"=>"elifesciences.org", "updated-at"=>"2012-10-08T22:43:26.470758", "value"=>"2012"}}}}}

    PUBLIC_KEY = {
      "url"   => "https://api.github.com/user/keys/1",
      "id"    => 1,
      "title" => "octocat@octomac",
      "key"   => "ssh-rsa AAA...",
    }

    REPO = {
      "url"              => "https://api.github.com/repos/octocat/Hello-World",
      "html_url"         => "https://github.com/octocat/Hello-World",
      "clone_url"        => "https://github.com/octocat/Hello-World.git",
      "git_url"          => "git://github.com/octocat/Hello-World.git",
      "ssh_url"          => "git@github.com:octocat/Hello-World.git",
      "svn_url"          => "https://svn.github.com/octocat/Hello-World",
      "mirror_url"       => "git://git.example.com/octocat/Hello-World",
      "id"               => 1296269,
      "owner"            => USER,
      "name"             => "Hello-World",
      "full_name"        => "octocat/Hello-World",
      "description"      => "This your first repo!",
      "homepage"         => "https://github.com",
      "language"         => nil,
      "private"          => false,
      "fork"             => false,
      "forks"            => 9,
      "watchers"         => 80,
      "size"             => 108,
      "master_branch"    => 'master',
      "open_issues"      => 0,
      "pushed_at"        => "2011-01-26T19:06:43Z",
      "created_at"       => "2011-01-26T19:01:12Z",
      "updated_at"       => "2011-01-26T19:14:43Z"
    }

    FULL_REPO = REPO.merge({
      "organization"     => USER.merge('type' => 'Organization'),
      "parent"           => REPO,
      "source"           => REPO,
      "has_issues"       => true,
      "has_wiki"         => true,
      "has_downloads"    => true
    })

    TAG = {
      "name"        => "v0.1",
      "commit"      => {
          "sha"     => "c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc",
          "url"  => "https://api.github.com/octocat/Hello-World/commits/c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc"
      },
      "zipball_url" => "https://github.com/octocat/Hello-World/zipball/v0.1",
      "tarball_url" => "https://github.com/octocat/Hello-World/tarball/v0.1",
    }

    BRANCHES = [
      {
        "name"   => "master",
        "commit" => {
          "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
          "url" => "https://api.github.com/repos/octocat/Hello-World/commits/c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc"
        }
      }
    ]

    BRANCH = {"name"=>"master",
 "commit"=>
  {"sha"=>"7fd1a60b01f91b314f59955a4e4d4e80d8edf11d",
   "commit"=>
    {"author"=>
      {"name"=>"The Octocat",
       "date"=>"2012-03-06T15:06:50-08:00",
       "email"=>"octocat@nowhere.com"},
     "url"=>
      "https://api.github.com/repos/octocat/Hello-World/git/commits/7fd1a60b01f91b314f59955a4e4d4e80d8edf11d",
     "message"=>
      "Merge pull request #6 from Spaceghost/patch-1\n\nNew line at end of file.",
     "tree"=>
      {"sha"=>"b4eecafa9be2f2006ce1b709d6857b07069b4608",
       "url"=>
        "https://api.github.com/repos/octocat/Hello-World/git/trees/b4eecafa9be2f2006ce1b709d6857b07069b4608"},
     "committer"=>
      {"name"=>"The Octocat",
       "date"=>"2012-03-06T15:06:50-08:00",
       "email"=>"octocat@nowhere.com"}},
   "author"=>
    {"gravatar_id"=>"7ad39074b0584bc555d0417ae3e7d974",
     "avatar_url"=>
      "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
     "url"=>"https://api.github.com/users/octocat",
     "id"=>583231,
     "login"=>"octocat"},
   "parents"=>
    [{"sha"=>"553c2077f0edc3d5dc5d17262f6aa498e69d6f8e",
      "url"=>
       "https://api.github.com/repos/octocat/Hello-World/commits/553c2077f0edc3d5dc5d17262f6aa498e69d6f8e"},
     {"sha"=>"762941318ee16e59dabbacb1b4049eec22f0d303",
      "url"=>
       "https://api.github.com/repos/octocat/Hello-World/commits/762941318ee16e59dabbacb1b4049eec22f0d303"}],
   "url"=>
    "https://api.github.com/repos/octocat/Hello-World/commits/7fd1a60b01f91b314f59955a4e4d4e80d8edf11d",
   "committer"=>
    {"gravatar_id"=>"7ad39074b0584bc555d0417ae3e7d974",
     "avatar_url"=>
      "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
     "url"=>"https://api.github.com/users/octocat",
     "id"=>583231,
     "login"=>"octocat"}},
 "_links"=>
  {"html"=>"https://github.com/octocat/Hello-World/tree/master",
   "self"=>"https://api.github.com/repos/octocat/Hello-World/branches/master"}}

 MERGE_COMMIT = {"commit"=>
  {"sha"=>"7fd1a60b01f91b314f59955a4e4d4e80d8edf11d",
   "commit"=>
    {"author"=>
      {"name"=>"The Octocat",
       "date"=>"2012-03-06T15:06:50-08:00",
       "email"=>"octocat@nowhere.com"},
     "url"=>
      "https://api.github.com/repos/octocat/Hello-World/git/commits/7fd1a60b01f91b314f59955a4e4d4e80d8edf11d",
     "message"=>
      "Shipped cool_feature!",
     "tree"=>
      {"sha"=>"b4eecafa9be2f2006ce1b709d6857b07069b4608",
       "url"=>
        "https://api.github.com/repos/octocat/Hello-World/git/trees/b4eecafa9be2f2006ce1b709d6857b07069b4608"},
     "committer"=>
      {"name"=>"The Octocat",
       "date"=>"2012-03-06T15:06:50-08:00",
       "email"=>"octocat@nowhere.com"}},
   "author"=>
    {"gravatar_id"=>"7ad39074b0584bc555d0417ae3e7d974",
     "avatar_url"=>
      "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
     "url"=>"https://api.github.com/users/octocat",
     "id"=>583231,
     "login"=>"octocat"},
   "parents"=>
    [{"sha"=>"553c2077f0edc3d5dc5d17262f6aa498e69d6f8e",
      "url"=>
       "https://api.github.com/repos/octocat/Hello-World/commits/553c2077f0edc3d5dc5d17262f6aa498e69d6f8e"},
     {"sha"=>"762941318ee16e59dabbacb1b4049eec22f0d303",
      "url"=>
       "https://api.github.com/repos/octocat/Hello-World/commits/762941318ee16e59dabbacb1b4049eec22f0d303"}],
   "url"=>
    "https://api.github.com/repos/octocat/Hello-World/commits/7fd1a60b01f91b314f59955a4e4d4e80d8edf11d",
   "committer"=>
    {"gravatar_id"=>"7ad39074b0584bc555d0417ae3e7d974",
     "avatar_url"=>
      "https://secure.gravatar.com/avatar/7ad39074b0584bc555d0417ae3e7d974?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
     "url"=>"https://api.github.com/users/octocat",
     "id"=>583231,
     "login"=>"octocat"}}}

    MILESTONE = {
      "url" => "https://api.github.com/repos/octocat/Hello-World/milestones/1",
      "number"        => 1,
      "state"         => "open",
      "title"         => "v1.0",
      "description"   => "",
      "creator"       => USER,
      "open_issues"   => 4,
      "closed_issues" => 8,
      "created_at"    => "2011-04-10T20:09:31Z",
      "due_on"        => nil
    }


    PULL = {
      "url"        => "https://api.github.com/octocat/Hello-World/pulls/1",
      "html_url"   => "https://github.com/octocat/Hello-World/pulls/1",
      "diff_url"   => "https://github.com/octocat/Hello-World/pulls/1.diff",
      "patch_url"  => "https://github.com/octocat/Hello-World/pulls/1.patch",
      "issue_url"  => "https://github.com/octocat/Hello-World/issue/1",
      "number"     => 1,
      "state"      => "open",
      "title"      => "new-feature",
      "body"       => "Please pull these awesome changes",
      "created_at" => "2011-01-26T19:01:12Z",
      "updated_at" => "2011-01-26T19:01:12Z",
      "closed_at"  => "2011-01-26T19:01:12Z",
      "merged_at"  => "2011-01-26T19:01:12Z",
      "head"          => {
        "label" => "new-topic",
        "ref"   => "new-topic",
        "sha"   => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
        "user"  => USER,
        "repo"  => REPO,
      },
      "base"          => {
        "label" => "master",
        "ref"   => "master",
        "sha"   => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
        "user"  => USER,
        "repo"  => REPO,
      },
      "_links" => {
        "self" => {'href' =>
          "https://api.github.com/octocat/Hello-World/pulls/1"},
        "html" => {'href' =>
          "https://github.com/octocat/Hello-World/pull/1"},
        "comments" => {'href' =>
          "https://api.github.com/octocat/Hello-World/issues/1/comments"},
        "review_comments" => {'href' =>
          "https://api.github.com/octocat/Hello-World/pulls/1/comments"}
      },
      "user" => USER
    }

    FULL_PULL = PULL.merge({
      "merged"        => false,
      "mergeable"     => true,
      "merged_by"     => USER,
      "comments"      => 10,
      "commits"       => 3,
      "additions"     => 100,
      "deletions"     => 3,
      "changed_files" => 5
    })

    COMMIT = {
      "url" => "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e",
      "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
      "commit" => {
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e",
        "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
        "author" => {
           "name"  => "Monalisa Octocat",
           "email" => "support@github.com",
           "date"  => "2011-04-14T16:00:49Z",
        },
        "committer" => {
           "name"  => "Monalisa Octocat",
           "email" => "support@github.com",
           "date"  => "2011-04-14T16:00:49Z",
        },
        "message" => "Fix all the bugs",
        "tree" => {
          "url" => "https://api.github.com/repos/octocat/Hello-World/tree/6dcb09b5b57875f334f61aebed695e2e4193db5e",
          "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
        },
      },
      "author" => USER,
      "committer" => USER,
      "parents" => [{
        "url" => "https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e",
        "sha" => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
      }]
    }

    FULL_COMMIT = COMMIT.merge({
      "stats" => {
        "additions" => 104,
        "deletions" => 4,
        "total"     => 108,
      },
      "files" => [{
        "filename"  => "file1.txt",
        "additions" => 10,
        "deletions" => 2,
        "changes" => 12,
        "status" => "modified",
        "raw_url" => "https://github.com/octocat/Hello-World/raw/7ca483543807a51b6079e54ac4cc392bc29ae284/file1.txt",
        "blob_url" => "https://github.com/octocat/Hello-World/blob/7ca483543807a51b6079e54ac4cc392bc29ae284/file1.txt",
        "patch" => "@@ -29,7 +29,7 @@\n....."
      }]
    })

    COMMIT_COMMENT = {
      "html_url"   => "https://github.com/octocat/Hello-World/commit/6dcb09b5b57875f334f61aebed695e2e4193db5e#commitcomment-1",
      "url"        => "https://api.github.com/repos/octocat/Hello-World/comments/1",
      "id"         => 1,
      "body"       => "Great stuff",
      "path"       => "file1.txt",
      "position"   => 4,
      "line"       => 14,
      "commit_id"  => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
      "user"       => USER,
      "created_at" => "2011-04-14T16:00:49Z",
      "updated_at" => "2011-04-14T16:00:49Z"
    }

    FILE = {
      "sha"       => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
      "filename"  => "file1.txt",
      "status"    => "added",
      "additions" => 103,
      "deletions" => 21,
      "changes"   => 124,
      "blob_url"  => "https://github.com/octocat/Hello-World/blob/6dcb09b5b57875f334f61aebed695e2e4193db5e/file1.txt",
      "raw_url"   => "https://github.com/octocat/Hello-World/raw/6dcb09b5b57875f334f61aebed695e2e4193db5e/file1.txt",
      "patch"     => "@@ -132,7 +132,7 @@ module Test @@ -1000,7 +1000,7 @@ module Test"
    }

    COMMIT_COMPARISON = {
      "url" => "https://api.github.com/repos/octocat/Hello-World/compare/master...topic",
      "html_url" => "https://github.com/octocat/Hello-World/compare/master...topic",
      "permalink_url" => "https://github.com/octocat/Hello-World/compare/octocat:bbcd538c8e72b8c175046e27cc8f907076331401...octocat:0328041d1152db8ae77652d1618a02e57f745f17",
      "diff_url" => "https://github.com/octocat/Hello-World/compare/master...topic.diff",
      "patch_url" => "https://github.com/octocat/Hello-World/compare/master...topic.patch",
      "base_commit" => COMMIT,
      "status" => "behind",
      "ahead_by" => 1,
      "behind_by" => 2,
      "total_commits" => 1,
      "commits" => [COMMIT],
      "files" => [FILE],
    }

    PULL_COMMENT = {
      "url"        => "https://api.github.com/repos/octocat/Hello-World/pulls/comments/1",
      "id"         => 1,
      "body"       => "Great stuff",
      "path"       => "file1.txt",
      "position"   => 4,
      "commit_id"  => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
      "user"       => USER,
      "created_at" => "2011-04-14T16:00:49Z",
      "updated_at" => "2011-04-14T16:00:49Z",
      "_links" => {
        "self" => {'href' =>
          "https://api.github.com/octocat/Hello-World/pulls/comments/1"},
        "html" => {'href' =>
          "https://github.com/octocat/Hello-World/pull/1#discussion-diff-1"},
        "pull_request" => {'href' =>
          "https://api.github.com/octocat/Hello-World/pulls/1"}
      }
    }

    DOWNLOAD = {
      "url"            => "https://api.github.com/repos/octocat/Hello-World/downloads/1",
      "html_url"       => "https://github.com/repos/octocat/Hello-World/downloads/new_file.jpg",
      "id"             => 1,
      "name"           => "new_file.jpg",
      "description"    => "Description of your download",
      "size"           => 1024,
      "download_count" => 40,
      "content_type"   => ".jpg"
    }

    CREATE_DOWNLOAD = DOWNLOAD.merge({
      "policy"         => "ewogICAg...",
      "signature"      => "mwnFDC...",
      "bucket"         => "github",
      "accesskeyid"    => "1ABCDEFG...",
      "path"           => "downloads/ocotocat/Hello-World/new_file.jpg",
      "acl"            => "public-read",
      "expirationdate" => "2011-04-14T16:00:49Z",
      "prefix"         => "downloads/octocat/Hello-World/",
      "mime_type"      => "image/jpeg",
      "redirect"       => false,
      "s3_url"         => "https://github.s3.amazonaws.com/"
    })

    ORG = {
      "login"      => "github",
      "id"         => 1,
      "url"        => "https://api.github.com/orgs/github",
      "avatar_url" => "https://github.com/images/error/octocat_happy.gif"
    }

    FULL_ORG = ORG.merge({
      "name"         => "github",
      "company"      => "GitHub",
      "blog"         => "https://github.com/blog",
      "location"     => "San Francisco",
      "email"        => "octocat@github.com",
      "public_repos" => 2,
      "public_gists" => 1,
      "followers"    => 20,
      "following"    => 0,
      "html_url"     => "https://github.com/octocat",
      "created_at"   => "2008-01-14T04:33:35Z",
      "type"         => "Organization"
    })

    PRIVATE_ORG = FULL_ORG.merge({
      "total_private_repos" => 100,
      "owned_private_repos" => 100,
      "private_gists"       => 81,
      "disk_usage"          => 10000,
      "collaborators"       => 8,
      "billing_email"       => "support@github.com",
      "plan"                => {
        "name"          => "Medium",
        "space"         => 400,
        "private_repos" => 20
      }
    })

    TEAM = {
      "url" => "https://api.github.com/teams/1",
      "name" => "Owners",
      "id" => 1
    }

    FULL_TEAM = TEAM.merge({
      "permission" => "admin",
      "members_count" => 3,
      "repos_count" => 10
    })

    LABEL = {
      "url"   => "https://api.github.com/repos/octocat/Hello-World/labels/bug",
      "name"  => "bug",
      "color" => "f29513"
    }

    ISSUE = {
      "url"        => "https://api.github.com/repos/octocat/Hello-World/issues/1",
      "html_url"   => "https://github.com/octocat/Hello-World/issues/1",
      "number"     => 1347,
      "state"      => "open",
      "title"      => "Found a bug",
      "body"       => "I'm having a problem with this.",
      "user"       => USER,
      "labels"     => [LABEL],
      "assignee"   => USER,
      "milestone"  => MILESTONE,
      "comments"   => 0,
      "pull_request" => {
        "html_url"  => "https://github.com/octocat/Hello-World/issues/1",
        "diff_url"  => "https://github.com/octocat/Hello-World/issues/1.diff",
        "patch_url" => "https://github.com/octocat/Hello-World/issues/1.patch"
      },
      "closed_at"  => nil,
      "created_at" => "2011-04-22T13:33:48Z",
      "updated_at" => "2011-04-22T13:33:48Z"
    }

    ISSUE_COMMENT = {
      "id"         => 1,
      "url"        => "https://api.github.com/repos/octocat/Hello-World/issues/comments/1",
      "body"       => "Me too",
      "user"       => USER,
      "created_at" => "2011-04-14T16:00:49Z",
      "updated_at" => "2011-04-14T16:00:49Z"
    }

    ISSUE_EVENT = {
      "url" => "https://api.github.com/repos/octocat/Hello-World/issues/events/1",
      "actor"      => USER,
      "event"      => "closed",
      "commit_id"  => "6dcb09b5b57875f334f61aebed695e2e4193db5e",
      "created_at" => "2011-04-14T16:00:49Z"
    }

    FULL_ISSUE_EVENT = ISSUE_EVENT.merge('issue' => ISSUE)

    ISSUE_SEARCH_ITEM = {
      "gravatar_id" =>  "4c3d600867886124a73f14a907b1a955",
      "position" =>  10,
      "number" =>  10,
      "votes" =>  2,
      "created_at" =>  "2010-06-04T23:20:33-07:00",
      "comments" =>  5,
      "body" =>  "Issue body goes here",
      "title" =>  "This is is the issue title",
      "updated_at" =>  "2010-06-04T23:20:33-07:00",
      "html_url" =>  "https://github.com/pengwynn/linkedin/issues/10",
      "user" =>  "ckarbass",
      "labels" =>  [
        "api",
        "feature request",
        "investigation"
      ],
      "state" =>  "open"
    }

    ISSUE_SEARCH_RESULTS = {
      "issues" => [ISSUE_SEARCH_ITEM]
    }

    REPO_SEARCH_ITEM = {
      "type" => "repo",
      "created" => "2011-09-05T11:07:54-07:00",
      "watchers" => 2913,
      "has_downloads" => true,
      "username" => "mathiasbynens",
      "homepage" => "http://mths.be/dotfiles",
      "url" => "https://github.com/mathiasbynens/dotfiles",
      "fork" => false,
      "has_issues" => true,
      "has_wiki" => false,
      "forks" => 520,
      "size" => 192,
      "private" => false,
      "followers" => 2913,
      "name" => "dotfiles",
      "owner" => "mathiasbynens",
      "open_issues" => 12,
      "pushed_at" => "2012-06-05T03:37:13-07:00",
      "score" => 3.289718,
      "pushed" => "2012-06-05T03:37:13-07:00",
      "description" => "sensible hacker defaults for OS X",
      "language" => "VimL",
      "created_at" => "2011-09-05T11:07:54-07:00"
    }

    REPO_SEARCH_RESULTS = {
      "repositories" => [REPO_SEARCH_ITEM]
    }

    USER_SEARCH_ITEM = {
      "gravatar_id" => "70889091349f7598bce9afa588034310",
      "name" => "Hirotaka Kawata",
      "created_at" => "2009-10-05T01:32:06Z",
      "location" => "Tsukuba, Ibaraki, Japan",
      "public_repo_count" => 8,
      "followers" => 10,
      "language" => "Python",
      "fullname" => "Hirotaka Kawata",
      "username" => "techno",
      "id" => "user-135050",
      "repos" => 8,
      "type" => "user",
      "followers_count" => 10,
      "pushed" => "2012-04-18T02:15:17.511Z",
      "login" => "techno",
      "score" => 4.2559967,
      "record" => nil,
      "created" => "2009-10-05T01:32:06Z"
    }

    USER_SEARCH_RESULTS = {
      "users" => [USER_SEARCH_ITEM]
    }

    EMAIL_SEARCH_RESULTS = {
      "user" => USER_SEARCH_ITEM
    }

    GIST_HISTORY = {
      "history" => [
        {
          "url"     => "https://api.github.com/gists/1/57a7f021a713b1c5a6a199b54cc514735d2d462f",
          "version" => "57a7f021a713b1c5a6a199b54cc514735d2d462f",
          "user"    => USER,
          "change_status" => {
            "deletions" => 0,
            "additions" => 180,
            "total"     => 180
          },
          "committed_at" => "2010-04-14T02:15:15Z"
        }
      ]
    }

    GIST_FORKS = {
      "forks" => [
        {
          "user" => USER,
          "url" => "https://api.github.com/gists/5",
          "created_at" => "2011-04-14T16:00:49Z"
        }
      ]
    }

    GIST_FILES = {
      "files" => {
        "ring.erl"   => {
          "size"     => 932,
          "filename" => "ring.erl",
          "raw_url"  => "https://gist.github.com/raw/365370/8c4d2d43d178df44f4c03a7f2ac0ff512853564e/ring.erl"
        }
      }
    }

    GIST = {
      "url"          => "https://api.github.com/gists/1",
      "id"           => "1",
      "description"  => "description of gist",
      "public"       => true,
      "user"         => USER,
      "files"        => GIST_FILES,
      "comments"     => 0,
      "html_url"     => "https://gist.github.com/1",
      "git_pull_url" => "git://gist.github.com/1.git",
      "git_push_url" => "git@gist.github.com:1.git",
      "created_at"   => "2010-04-14T02:15:15Z"
    }.update(GIST_FILES)

    FULL_GIST = GIST.merge(GIST_FORKS).merge(GIST_HISTORY)
    FULL_GIST['files']['ring.erl']['content'] = 'contents of gist'

    GIST_COMMENT = {
      "id"         => 1,
      "url"        => "https://api.github.com/gists/comments/1",
      "body"       => "Just commenting for the sake of commenting",
      "user"       => USER,
      "created_at" => "2011-04-18T23:23:56Z"
    }

    TREE = {
      "sha"  => "9fb037999f264ba9a7fc6274d15fa3ae2ab98312",
      "url"  => "https://api.github.com/repo/octocat/Hello-World/trees/9fb037999f264ba9a7fc6274d15fa3ae2ab98312",
      "tree"  => [
        { "path" => "file.rb",
          "mode" => "100644",
          "type" => "blob",
          "size" => 30,
          "sha"  => "44b4fc6d56897b048c772eb4087f854f46256132",
          "url"  => "https://api.github.com/octocat/Hello-World/git/blobs/44b4fc6d56897b048c772eb4087f854f46256132",
        },
        { "path" => "subdir",
          "mode" => "040000",
          "type" => "tree",
          "sha"  => "f484d249c660418515fb01c2b9662073663c242e",
          "url"  => "https://api.github.com/octocat/Hello-World/git/blobs/f484d249c660418515fb01c2b9662073663c242e"
        },
        { "path" => "exec_file",
          "mode" => "100755",
          "type" => "blob",
          "size" => 75,
          "sha"  => "45b983be36b73c0788dc9cbcb76cbb80fc7bb057",
          "url"  => "https://api.github.com/octocat/Hello-World/git/blobs/45b983be36b73c0788dc9cbcb76cbb80fc7bb057",
        }
      ]
    }
    TREE_EXTRA = {
      "sha"  => "fc6274d15fa3ae2ab983129fb037999f264ba9a7",
      "url"  => "https://api.github.com/repo/octocat/Hello-World/trees/fc6274d15fa3ae2ab983129fb037999f264ba9a7",
      "tree" => [ {
          "path" => "subdir/file.txt",
          "mode" => "100644",
          "type" => "blob",
          "size" => 132,
          "sha"  => "7c258a9869f33c1e1e1f74fbb32f07c86cb5a75b",
          "url"  => "https://api.github.com/octocat/Hello-World/git/7c258a9869f33c1e1e1f74fbb32f07c86cb5a75b"
      } ]
    }
    TREE_NEW = {
      "sha"  => "cd8274d15fa3ae2ab983129fb037999f264ba9a7",
      "url"  => "https://api.github.com/repo/octocat/Hello-World/trees/cd8274d15fa3ae2ab983129fb037999f264ba9a7",
      "tree" => [ {
          "path" => "file.rb",
          "mode" => "100644",
          "type" => "blob",
          "size" => 132,
          "sha"  => "7c258a9869f33c1e1e1f74fbb32f07c86cb5a75b",
          "url"  => "https://api.github.com/octocat/Hello-World/git/blobs/7c258a9869f33c1e1e1f74fbb32f07c86cb5a75b"
      } ]
    }

    GIT_COMMIT = {
      "sha" => "7638417db6d59f3c431d3e1f261cc637155684cd",
      "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/7638417db6d59f3c431d3e1f261cc637155684cd",
      "author" => {
        "date" => "2010-04-10T14:10:01-07:00",
        "name" => "Scott Chacon",
        "email" => "schacon@gmail.com"
      },
      "committer" => {
        "date" => "2010-04-10T14:10:01-07:00",
        "name" => "Scott Chacon",
        "email" => "schacon@gmail.com"
      },
      "message" => "added readme, because im a good github citizen\n",
      "tree" => {
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/trees/691272480426f78a0138979dd3ce63b77f706feb",
        "sha" => "691272480426f78a0138979dd3ce63b77f706feb"
      },
      "parents" => [
        {
          "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/1acc419d4d6a9ce985db7be48c6349a0475975b5",
          "sha" => "1acc419d4d6a9ce985db7be48c6349a0475975b5"
        }
      ]
    }

    NEW_COMMIT = {
      "sha" => "7638417db6d59f3c431d3e1f261cc637155684cd",
      "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/7638417db6d59f3c431d3e1f261cc637155684cd",
      "author" => {
        "date" => "2008-07-09T16:13:30+12:00",
        "name" => "Scott Chacon",
        "email" => "schacon@gmail.com"
      },
      "committer" => {
        "date" => "2008-07-09T16:13:30+12:00",
        "name" => "Scott Chacon",
        "email" => "schacon@gmail.com"
      },
      "message" => "my commit message",
      "tree" => {
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/trees/827efc6d56897b048c772eb4087f854f46256132",
        "sha" => "827efc6d56897b048c772eb4087f854f46256132"
      },
      "parents" => [
        {
          "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/7d1b31e74ee336d15cbd21741bc88a537ed063a0",
          "sha" => "7d1b31e74ee336d15cbd21741bc88a537ed063a0"
        }
      ]
    }

    GITTAG = {
      "tag" => "v0.0.1",
      "sha" => "940bd336248efae0f9ee5bc7b2d5c985887b16ac",
      "url" => "https://api.github.com/repos/octocat/Hello-World/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac",
      "message" => "initial version\n",
      "tagger" => {
        "name" => "Scott Chacon",
        "email" => "schacon@gmail.com",
        "date" => "2011-06-17T14:53:35-07:00"
      },
      "object" => {
        "type" => "commit",
        "sha" => "c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c",
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c"
      }
    }

    REF = {
      "ref" => "refs/heads/sc/featureA",
      "url" => "https://api.github.com/repos/octocat/Hello-World/git/refs/heads/sc/featureA",
      "object" => {
        "type" => "commit",
        "sha" => "aa218f56b14c9653891f9e74264a383fa43fefbd",
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/aa218f56b14c9653891f9e74264a383fa43fefbd"
      }
    }

    REFS = [
      {
        "ref" => "refs/heads/master",
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/refs/heads/master",
        "object" => {
          "type" => "commit",
          "sha" => "aa218f56b14c9653891f9e74264a383fa43fefbd",
          "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/aa218f56b14c9653891f9e74264a383fa43fefbd"
        }
      },
      {
        "ref" => "refs/heads/gh-pages",
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/refs/heads/gh-pages",
        "object" => {
          "type" => "commit",
          "sha" => "612077ae6dffb4d2fbd8ce0cccaa58893b07b5ac",
          "url" => "https://api.github.com/repos/octocat/Hello-World/git/commits/612077ae6dffb4d2fbd8ce0cccaa58893b07b5ac"
        }
      },
      {
        "ref" => "refs/tags/v0.0.1",
        "url" => "https://api.github.com/repos/octocat/Hello-World/git/refs/tags/v0.0.1",
        "object" => {
          "type" => "tag",
          "sha" => "940bd336248efae0f9ee5bc7b2d5c985887b16ac",
          "url" => "https://api.github.com/repos/octocat/Hello-World/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac"
        }
      }
    ]

    HOOK = {
      "url" => "https://api.github.com/repos/octocat/Hello-World/hooks/1",
      "updated_at" => "2011-09-06T20:39:23Z",
      "created_at" => "2011-09-06T17:26:27Z",
      "name" => "web",
      "events" => ["push"],
      "active" => true,
      "config" =>
        {'url' => 'http://example.com', 'content_type' => 'json'},
      "id" => 1
    }

    OAUTH_ACCESS = {
      "id" => 1,
      "url" => "https://api.github.com/authorizations/1",
      "scopes" => ["public_repo"],
      "token" => "abc123",
      "app" => {
        "url" => "http://my-github-app.com",
        "name" => "my github app"
      },
      "note" => "optional note",
      "note_url" => "http://optional/note/url",
      "updated_at" => "2011-09-06T20:39:23Z",
      "created_at" => "2011-09-06T17:26:27Z"
    }

    EVENT = {
      :type   => "Event",
      :public => true,
      :payload => {},
      :repo => {
        :id => 3,
        :name => "octocat/Hello-World",
        :url => "https://api.github.com/repos/octocat/Hello-World"
      },
      :actor => USER,
      :org => USER,
      :created_at => "2011-09-06T17:26:27Z",
      :id => "12345"
    }

    README_CONTENT = {
      "type" =>  "file",
      "encoding" =>  "base64",
      "_links" =>  {
        "git" =>  "https://api.github.com/repos/pengwynn/octokit/git/blobs/3d21ec53a331a6f037a91c368710b99387d012c1",
        "self" =>  "https://api.github.com/repos/pengwynn/octokit/contents/README.md",
        "html" =>  "https://github.com/pengwynn/octokit/blob/master/README.md"
      },
      "size" =>  5362,
      "name" =>  "README.md",
      "path" =>  "README.md",
      "content" =>  "encoded content ...",
      "sha" =>  "3d21ec53a331a6f037a91c368710b99387d012c1"
    }

    STATUS = {
      "created_at" => "2012-07-20T01:19:13Z",
      "updated_at" => "2012-07-20T01:19:13Z",
      "state" => "success",
      "target_url" => "https://ci.example.com/1000/output",
      "description" => "Build has completed successfully",
      "id" => 1,
      "url" => "https://api.github.com/repos/octocat/example/statuses/1",
      "creator" => USER
    }

    BLOB = {
      :content => "Content of the blob",
      :encoding => "utf-8",
      :sha => "3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15",
      :size => 100
    }
  end
end

include GitHub::Resources::Helpers
