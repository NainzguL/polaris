FROM flyway/flyway
COPY db/ /flyway/sql/
COPY container/flyway/entry_point.sh /flyway/
ENTRYPOINT ["/flyway/entry_point.sh"]
CMD ["-?"]