FROM postgres:13.4

RUN apt-get update \
      && apt-cache showpkg postgresql-13-cron \
      && apt-get install -y postgresql-13-cron \
      && rm -rf /var/lib/apt/lists/* 

CMD ["postgres", "-c" , "shared_preload_libraries=pg_cron", "-c", "cron.database_name=eligsvcdb" ]
