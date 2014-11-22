## query the microsoft ngram viewer with R
library(httr)
library(jsonlite)

## set a cookie manually
##      I copied this from the network request panel of the  chrome developer tools
cookie <- "OmniID=c_7f622dc5a8b947e3924a5eb6d3caf99a; MC1=GUID=52656f787d3a3f4791347e80f421a588&HASH=786f&LV=201406&V=4&LU=1401615211750; A=I&I=AxUFAAAAAADSBgAAe20GWlNHN6xwMaGKZCwILQ!!&V=4; MUID=06D69B5D62C561901A079D1466C562BF; s_sq=msnportalbetarmc%3D%2526pid%253DWeb%252520N-Gram%252520-%252520Microsoft%252520Research%2526pidt%253D1%2526oid%253Dhttp%25253A//weblm.research.microsoft.com/info/rest.html%2526ot%253DA; s_cc=true"
cc <- sapply(strsplit(cookie,"; ")[[1]], function(x){
        sapply(URLdecode(x)[[1]], function(p){strsplit(p,"=")[1]})
        })
cc
# show contents of the longest cookie value - twice url-encoded
#       URLdecode(URLdecode("%26pid%3DWeb%2520N-Gram%2520-%2520Microsoft%2520Research%26pidt%3D1%26oid%3Dhttp%253A//weblm.research.microsoft.com/info/rest.html%26ot%3DA"))
set_cookies(cookie)

## create the url
utok <- "u=aed4a377-my-user-token"
catalog <- "http://weblm.research.microsoft.com/rest.svc/bing-body/2013-12/5"
op <-"gen"
format <- "format=json"
qry <- URLencode(str)

str <- "time to take a"
url1 <- sprintf("%s/%s?%s&%s&%s", catalog, op,  utok, qry, format )
url1
#http://weblm.research.microsoft.com/rest.svc/bing-body/2013-12/5/gen?u=aed4a377-3db5-4197-a435-6ea6fccd591d&p=to%20take%20a&format=json
#http://weblm.research.microsoft.com/rest.svc/bing-body/2013-12/5/gen?u=aed4a377-3db5-4197-a435-6ea6fccd591d&p=and+settle+the+&format=json
resp <- fromJSON(rawToChar((GET(url1))$content))
resp <- transform(data.frame(nextword= resp$words, prob=resp$probabilities))

resp[order(-resp$prob),]

