#!/bin/bash
curl -XDELETE http://$1:9200/$2

curl -XPUT  http://$1:9200/$2

curl -XPOST http://$1:9200/$2/suggestion/_mapping -d '
{
    "suggestion": {
        "_source": {
            "enabled": true
        },
        "_all": {
            "enabled": true
        },
        "dynamic": false,
        "properties": {
            "ac": {
                "type": "completion",
                "analyzer": "simple",
                "payloads": false
            }
        }
    }
}'


