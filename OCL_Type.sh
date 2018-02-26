curl -XPOST http://cert.elasticsearch:9200/documents_t20/document/_mapping -d '
{
      "document" : {
        "dynamic" : "false",
        "_all" : {
          "enabled" : true
        },
        "properties" : {
          "abstract" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "attachments_label" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "case_cause_id" : {
            "type" : "integer"
          },
          "content" : {
            "type" : "string",
            "store" : true,
            "term_vector" : "with_positions_offsets",
            "norms" : {
              "enabled" : false
            },
            "fields" : {
              "en" : {
                "type" : "string",
                "norms" : {
                  "enabled" : false
                },
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "content_type" : {
            "type" : "string",
            "index" : "not_analyzed",
            "store" : true
          },
          "court1" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "court2" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "court_id" : {
            "type" : "integer"
          },
          "created_at" : {
            "type" : "date",
            "format" : "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
          },
          "effected_date" : {
            "type" : "date",
            "ignore_malformed" : true,
            "format" : "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
          },
          "effected_date " : {
            "type" : "date",
            "format" : "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
          },
          "effectiveness" : {
            "type" : "string",
            "index" : "not_analyzed"
          },
          "effectiveness_id" : {
            "type" : "integer"
          },
          "firm" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "id" : {
            "type" : "string",
            "index" : "not_analyzed"
          },
          "input_time" : {
            "type" : "date",
            "ignore_malformed" : true,
            "format" : "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
          },
          "issue_no" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              },
              "recognition" : {
                "type" : "string",
                "analyzer" : "standard"
              }
            },
            "analyzer" : "issue_no_index",
            "search_analyzer" : "issue_no_search"
          },
          "judger" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "judicial_gist" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "jurisdictional_id" : {
            "type" : "integer"
          },
          "keyword" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "lang" : {
            "type" : "string",
            "index" : "not_analyzed"
          },
          "paragraphs" : {
            "type" : "nested",
            "properties" : {
              "paragraph" : {
                "type" : "string",
                "fields" : {
                  "en" : {
                    "type" : "string",
                    "analyzer" : "english"
                  }
                },
                "analyzer" : "chinese"
              }
            }
          },
          "promulgation_date" : {
            "type" : "date",
            "format" : "strict_date_optional_time||epoch_millis"
          },
          "promulgation_year" : {
            "type" : "integer"
          },
          "promulgator" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "region" : {
            "type" : "string",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              },
              "facet" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            },
            "analyzer" : "chinese"
          },
          "region_id" : {
            "type" : "integer"
          },
          "tags" : {
            "type" : "string",
            "fields" : {
              "facet" : {
                "type" : "string",
                "index" : "not_analyzed"
              }
            },
            "analyzer" : "chinese"
          },
          "taxonomy_id" : {
            "type" : "integer"
          },
          "title" : {
            "type" : "string",
            "term_vector" : "with_positions_offsets",
            "fields" : {
              "en" : {
                "type" : "string",
                "analyzer" : "english"
              }
            },
            "analyzer" : "chinese"
          },
          "translation_id" : {
            "type" : "string",
            "index" : "not_analyzed"
          },
          "trial_process" : {
            "type" : "string",
            "index" : "not_analyzed"
          }
        }
      }
}
