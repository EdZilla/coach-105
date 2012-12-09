dataSource {
    pooled = false
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            def logSql = true
            //dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"
			
            // dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            // url = "jdbc:hsqldb:mem:devDB"
				
            driverClassName = "com.mysql.jdbc.Driver"
            username = "ejy"
            password = "gr00vy"
            url = "jdbc:mysql://localhost/coach"
						
            //url = "jdbc:hsqldb:mem:testDb"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    falcon {
        dataSource {
            //dbCreate = "update"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			
            driverClassName = "com.mysql.jdbc.Driver"
            //username = "ejy"
            //password = "Mklrxttt"
				
            username = "ejy"
            password = "Mklrxttt"
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = "jdbc:mysql://localhost/coach_prod"
            //url = "jdbc:mysql://localhost/db_1_3575"
            url = "jdbc:mysql://localhost/coach_prod"
        }
    }

    production {
        dataSource {
            //dbCreate = "update"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"

            driverClassName = "com.mysql.jdbc.Driver"
            //username = "ejy"
            //password = "Mklrxttt"

            username = "ejy"
            password = "Mklrxttt"
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = "jdbc:mysql://localhost/coach_prod"
            //url = "jdbc:mysql://localhost/db_1_3575"
            url = "jdbc:mysql://localhost/coach_prod"
        }
    }
}
