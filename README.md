jar2dep
=======

A small utility that creates a maven dependency snippet out of the given jar.

A more advanced use case could be something like:

```
(SKIPJARS="(^classes.jar|.*license)";\
             echo '<dependencies>';\
             for FILE in /opt/tomcat/lib/*.jar; do\
                [[ ! `basename $FILE` =~ $SKIPJARS ]] && jar2dep $FILE provided;\
             done;\
             echo '</dependencies>') | xmllint -format - | tail -n +2
```
