monetdb stop hackadb
monetdb destroy -f hackadb
monetdb create hackadb
monetdb set embedpy=true hackadb
monetdb start hackadb
monetdb release hackadb
