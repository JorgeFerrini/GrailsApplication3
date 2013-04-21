        dataSource {
                    pooled = true
                    driverClassName = "oracle.jdbc.OracleDriver"
                    username = "desarrollo"
                    password = "1234"
                  }
                  hibernate {
                       cache.use_second_level_cache = true
                       cache.use_query_cache = true
                       cache.provider_class = "net.sf.ehcache.hibernate.EhCacheProvider"
                   }
                 // environment specific settings
                   environments {
                  development {
                          dataSource {
                                       dbCreate = "create-drop" // one of ‘create’, ‘create-drop’,'update’
                                        url = "jdbc:oracle:thin:@localhost:1521:XE"
                                  }
                   }
                   test {
                           dataSource {
                                        dbCreate = "update"
                                         url = "jdbc:oracle:thin:@localhost:1521:XE"
                            }
                     }
                     production {
                                     dataSource {
                                            dbCreate = "update"
                                            url = "jdbc:oracle:thin:@localhost:1521:XE"
                                    }
                      }
               }