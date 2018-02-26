#!/bin/bash
curl -XDELETE http://$1:9200/$2

curl -XPUT http://127.0.0.1:9200/documents_v3 -d '
{
    "settings":{
        "number_of_shards": 3,
        "number_of_replicas": 3,
        "analysis": {
            "analyzer": {
                "chinese": {
                    "tokenizer": "ik_max_word",
                    "filter": [
                        "synonym_zh",
                        "chinese_stop",
                        "trim"
                    ],
                    "char_filter": [
                        "symbol_mappings"
                    ]
                },
                "english": {
                    "tokenizer": "standard",
                    "filter": [
                        "lowercase",
                        "synonym_en",
                        "english_possessive_stemmer",
                        "english_stop",
                        "english_stemmer",
                        "trim"
                    ],
                    "char_filter": [
                        "html_strip",
                        "symbol_mappings"
                    ]
                }
            },
            "filter": {
                "synonym_en": {
                    "type": "synonym",
                    "ignore_case": true,
                    "tokenizer": "standard",
                    "synonyms_path": "analysis/synonym_en.txt"
                },
                "synonym_zh": {
                    "type": "synonym",
                    "ignore_case": true,
                    "tokenizer": "ik_max_word",
                    "synonyms_path": "analysis/synonym_zh.txt"
                },
                "chinese_stop": {
                    "type": "stop",
                    "stopwords_path": "stopwords/chinese.txt"
                },
                "english_stop": {
                    "type": "stop",
                    "stopwords_path": "stopwords/english.txt"
                },
                "english_stemmer": {
                  "type": "stemmer",
                  "language": "english"
                },
                "english_possessive_stemmer": {
                  "type": "stemmer",
                  "language": "possessive_english"
                }
            },
            "char_filter": {
                "symbol_mappings": {
                    "type": "mapping",
                    "mappings": [
                      "% => percent",
                      "$ => USD",
                      "￥ => RMB"
                    ]
                }
            }
        }
    }
}'


curl -XPOST http://127.0.0.1:9200/documents_v3/document_v3/_mapping -d '
{
    "document_v3": {
        "_source": {
            "enabled": true
        },
        "_all": {
            "enabled": true
        },
        "dynamic": false,
        "properties": {
            "id": {
                "type": "text",
                "index": "not_analyzed"
            },
            "content": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "term_vector": "with_positions_offsets",
                "store": "true",
                "norms": {
                    "enabled": false
                },
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english",
                        "norms": {
                            "enabled": false
                        }
                    }
                }
            },
            "paragraphs": {
                "type": "nested",
                "properties": {
                    "paragraph": {
                        "type": "text",
                        "index": "analyzed",
                        "analyzer": "chinese",
                        "store": "false",
                        "fields": {
                            "en": {
                                "type": "text",
                                "analyzer": "english"
                            }
                        }
                    }
                }
            },
            "judicial_gist": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "store": "false",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    }
                }
            },
            "abstract": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "store": "false",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    }
                }
            },
            "keyword": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "store": "false",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    }
                }
            },
            "promulgation_date": {
                "type": "date"
            },
            "promulgation_year": {
                "type": "integer"
            },
            "tags": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "facet": {
                        "type": "text",
                        "index": "not_analyzed"
                    }
                }
            },
            "lang": {
                "type": "text",
                "index": "not_analyzed"
            },
            "promulgator": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    },
                    "recognition": {
                        "type": "text",
                        "analyzer": "standard"
                    }
                }
            },
            "court1": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    },
                    "recognition": {
                        "type": "text",
                        "analyzer": "standard"
                    }
                }
            },
            "court2": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    },
                    "recognition": {
                        "type": "text",
                        "analyzer": "standard"
                    }
                }
            },
            "issue_no": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    },
                    "recognition": {
                        "type": "text",
                        "analyzer": "standard"
                    }
                }
            },
            "region": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "facet": {
                        "type": "text",
                        "index": "not_analyzed"
                    },
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    }
                }
            },
            "region_id": {
                "type": "integer"
            },
            "effectiveness": {
                "type": "text",
                "index": "not_analyzed"
            },
            "effectiveness_id": {
                "type": "integer"
            },
            "taxonomy_id": {
                "type": "integer"
            },
            "court_id": {
                "type": "integer"
            },
            "translation_id": {
                "type": "text",
                "index": "not_analyzed"
            },
            "jurisdictional_id": {
                "type": "integer"
            },
            "case_cause_id": {
                "type": "integer"
            },
            "firm": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    }
                }
            },
            "attachments_label": {
                "type": "text",
                "index": "analyzed",
                "analyzer": "chinese",
                "store": "false",
                "fields": {
                    "en": {
                        "type": "text",
                        "analyzer": "english"
                    }
                }
            },
            "trial_process": {
                "type": "text",
                "index": "not_analyzed"
            },
            "content_type": {
                "type": "text",
                "index": "not_analyzed",
                "store": "yes"
            }
        }
    }
}'


curl -XPOST http://127.0.0.1:9200/_reindex -d '{
  "source": {
    "index": "documents"
  },
  "dest": {
    "index": "documents_test1",
    "op_type": "create"
  }


  "source": {
    "remote": {
      "host": "http://10.123.4.220:9200"
    },
    "index": "documents_v6",
    "type": "document"
    "size": 10000
    "query": {
      "match": {
        "content_type": "law"
      }
    }
  },
  "dest": {
    "index": "documents_v1"
    "op_type": "create"
  }
}'



curl -XPOST 'http://localhost:9200/_aliases' -d '
{
    "actions": [
        {"add": {"index": "documents_alpha_1", "alias": "documents_alpha"}}
    ]
}'


curl -XPOST 'http://localhost:9200/_aliases' -d '
{
    "actions": [
        {"remove": {"index": "documents_20161130", "alias": "documents_qa"}}
    ]
}'


curl -XGET 'http://127.0.0.1:9200/_cat/indices?v'


curl -XDELETE 'http://127.0.0.1:9200/documents_ly_t2'





DB_CONNECTION=mysql
DB_HOST=172.31.28.23
DB_PORT=3306
DB_DATABASE=ocl
DB_USERNAME=ocl
DB_PASSWORD=QHM3qZ/d4Rk=
DB_TIMEZONE=-05:00


mongoimport --db ocl_v1 --collection documents --file ./ocl_mongo_161223.json --jsonArray


