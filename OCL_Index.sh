curl -XPUT http://cert.elasticsearch:9200/documents_t20 -d '
{
    "settings" : {
      "index" : {
        "number_of_shards" : "3",
        "max_result_window" : "10000000",
        "analysis" : {
          "filter" : {
            "synonym_en" : {
              "ignore_case" : "true",
              "type" : "synonym",
              "synonyms_path" : "analysis/synonym_en.txt",
              "tokenizer" : "standard"
            },
            "english_stemmer" : {
              "type" : "stemmer",
              "language" : "english"
            },
            "chinese_stop" : {
              "type" : "stop",
              "stopwords_path" : "stopwords/chinese.txt"
            },
            "chinese_issue_no_stop" : {
              "type" : "stop",
              "stopwords": [ "年", "第", "号", "文"]
            },
            "english_stop" : {
              "type" : "stop",
              "stopwords_path" : "stopwords/english.txt"
            },
            "baseform" : {
              "type" : "baseform",
              "language" : "en"
            },
            "english_possessive_stemmer" : {
              "type" : "stemmer",
              "language" : "possessive_english"
            },
            "synonym_zh" : {
              "ignore_case" : "true",
              "type" : "synonym",
              "synonyms_path" : "analysis/synonym_zh.txt",
              "tokenizer" : "ik_smart"
            }
          },
          "analyzer" : {
            "english" : {
              "filter" : [ "lowercase", "synonym_en", "baseform", "english_possessive_stemmer", "english_stop", "english_stemmer", "trim" ],
              "char_filter" : [ "html_strip", "symbol_mappings" ],
              "tokenizer" : "standard"
            },
            "chinese" : {
              "filter" : [ "synonym_zh", "chinese_stop", "trim" ],
              "char_filter" : [ "symbol_mappings", "tsconvert" ],
              "tokenizer" : "ik_smart"
            },
            "issue_no_search" : {
              "filter" : [ "unique", "chinese_issue_no_stop", "trim"],
              "char_filter" : [ "tsconvert" ],
              "tokenizer" : "ik_max_word"
            },
            "issue_no_index" : {
              "filter" : ["chinese_issue_no_stop", "trim"],
              "char_filter" : [ "tsconvert" ],
              "tokenizer" : "ik_max_word"
            }
          },
          "char_filter" : {
            "symbol_mappings" : {
              "type" : "mapping",
              "mappings" : [ "% => percent", "$ => USD", "￥ => RMB" ]
            }
          }
        },
        "number_of_replicas" : "1"
      }
    }
}'



curl -XPOST http://cert.elasticsearch:9200/_reindex -d '
{
  "source": {
    "index": "documents"
  },
  "dest": {
    "index": "documents_t20",
    "op_type": "create"
  }
}'

curl -XGET http://127.0.0.1:9200/documents_t2/_analyze?analyzer=unique_ik&pretty -d '国税发2010年第17号文'