compdef psql pg_dump createdb dropdb

#
# zsh completion functions for PostgreSQL client programs.  Based on
# _mysql_utils.
#
# Dominic Mitchell <dom+zsh@xxxxxxxxxxxxxxxx>
#

_pgsql_get_identity () {
    _pgsql_user=${(v)opt_args[(i)-U|--username]}
    _pgsql_port=${(v)opt_args[(i)-p|--port]}
    _pgsql_host=${(v)opt_args[(i)-h|--host]}

    _pgsql_params=(
        ${_pgsql_user:+"--username=$_pgsql_user"}
        ${_pgsql_port:+"--port=$_pgsql_port"}
        ${_pgsql_host:+"--host=$_pgsql_host"}
    )
}

_pgsql_users () {
    local _pgsql_user _pgsql_port _pgsql_host _pgsql_params
    _pgsql_get_identity

    # We use _pgsql_port and _pgsql_host directly here instead of
    # _pgsql_params so as to not pick up a partially completed
    # username.
    _pgsql_params=(
        ${_pgsql_port:+"--port=$_pgsql_port"}
        ${_pgsql_host:+"--host=$_pgsql_host"}
    )

    compadd "$@" - ${${(f)~~"$( psql $_pgsql_params[@] -At -c '\du' template1 )"}[@]%%|*}
}

_pgsql_tables () {
    local _pgsql_user _pgsql_port _pgsql_host _pgsql_params
    _pgsql_get_identity

    # Need to pull out the database name from the existing arguments.
    # This is going to vary between commands.  Thankfully, it's only
    # used by pg_dump, which always has the dbname in arg1.  If it's
    # not present it defaults to ${PGDATABASE:-$LOGNAME}, which
    # matches (I think) the PostgreSQL behaviour.

    local db
    db=${line[1]:-${PGDATABASE:-$LOGNAME}}

    # XXX In postgres 7.3 and above, the schema name is in the first
    # column.  I'm not sure how best to work around that...  It really
    # needs to be prepended with a "." to the table name.

    # Many thanks to Oliver Kiddle for pointing out how to get the 2nd
    # column out of this...
    compadd "$@" - \
        ${${${(f)~~"$( psql $_pgsql_params[@] -At -c '\dt' $db )"}#*|}%%|*}
}

_pgsql_databases () {
    local _pgsql_user _pgsql_port _pgsql_host _pgsql_params
    _pgsql_get_identity

    # Should I grep out template0?
    compadd "$@" - ${${(f)~~"$( psql $_pgsql_params[@] -At -l)"}[@]%%|*}
}


##
## The actual completion code for the commands
##

_psql () {
    local curcontext="$curcontext" state line expl
    typeset -A opt_args

    _arguments -C -s \
        "$_pgsql_common_opts[@]" \
        {-V,--version}'[display client version]' \
        {-a,--echo-all}'[print commands read]' \
        {-A,--no-align}'[unaligned output mode]' \
        {-c+,--command=}':execute SQL command:' \
        {-d+,--dbname=}':database to connect to:_pgsql_databases' \
        {-e,--echo-queries}'[display queries submitted]' \
        {-E,--echo-hidden}'[display hidden queries]' \
        {-f+,--file=}':SQL file to read:_files' \
        {-F+,--field-separator=}':field separator char:' \
        {-H,--html}'[HTML output]' \
        {-l,--list}'[list databases]' \
        {-o+,--output=}':query output:_files' \
        {-P+,--pset=}':set psql variable:' \
        {-q,--quiet}'[non verbose mode]' \
        {-R+,--record-separator=}':record separator char:' \
        {-s,--single-step}'[prompt before each query]' \
        {-S,--single-line}'[newline sends query]' \
        {-t,--tuples-only}'[dont display header/footer]' \
        {-T+,--table-attr=}':HTML table options:' \
        -u'[prompt for username/password]' \
        {-v+,--set=,--variable=}':set SQL variable:' \
        {-x,--expanded}'[one column per line]' \
        {-X,--no-psqlrc}'[dont read ~/.psqlrc]' \
        ':PostgreSQL database:_pgsql_databases' \
        ':PostgreSQL user:_pgsql_users'
}

_pg_dump () {
    local curcontext="$curcontext" state line expl
    typeset -A opt_args

    _arguments -C -s \
        "$_pgsql_common_opts[@]" \
        {-a,--data-only}'[dump only data]' \
        {-b,--blobs}'[dump blobs as well]' \
        {-c,--clean}'[include clean cmds in dump]' \
        {-C,--create}'[include createdb cmds in dump]' \
        {-d,--inserts}'[use INSERT not COPY]' \
        {-D,--{attribute,column}-inserts}'[use INSERT (cols) not COPY]' \
        {-f+,--file=}':output file:_files' \
        {-F+,--format=}':output format:_values "format" "p[plain text]" "t[tar]" "c[custom]"' \
        {-i,--ignore-version}'[ignore version mismatch]' \
        {-n+,--schema=}':schema to dump:' \
        {-o,--oids}'[dump objects identifiers for every table]' \
        {-O,--no-owner}'[dont recreate as same owner]' \
        {-R,--no-reconnect}'[dont output connect]' \
        {-s,--schema-only}'[no data, only schema]' \
        {-S+,--superuser=}':superuser name:_pgsql_users' \
        {-t+,--table=}':table to dump:_pgsql_tables' \
        {-v,--verbose}'[verbose mode]' \
        {-V,--version}'[display client version]' \
        {-x,--no-{acl,privileges}}'[dont dump ACLs]' \
        -X+':option:_values "option" use-set-session-authorization disable-triggers' \
        {-Z+,--compress=}':compression level:_values "level" 9 8 7 6 5 4 3 2 1 0' \
        ':PostgreSQL database:_pgsql_databases'
}

_createdb () {
    local curcontext="$curcontext" state line expl
    typeset -A opt_args

    _arguments -C -s \
        "$_pgsql_common_opts[@]" \
        {-e,--echo}'[display SQL queries]' \
        {-q,--quiet}'[non verbose mode]' \
        {-D+,--location=}':database location:_directories' \
        {-T+,--template=}':database template:_pgsql_databases' \
        {-E+,--encoding=}':database encoding:_values "encoding" $_pgsql_encodings[@]' \
        ':PostgreSQL database:' \
        ':comment:'
}

_dropdb () {
    local curcontext="$curcontext" state line expl
    typeset -A opt_args

    _arguments -C -s \
        "$_pgsql_common_opts[@]" \
        {-e,--echo}'[display SQL queries]' \
        {-q,--quiet}'[non verbose mode]' \
        {-i,--interactive}'[confirm before drop]' \
        ':PostgreSQL database:_pgsql_databases'
}

_pgsql_utils () {
    local _pgsql_common_opts _pgsql_encodings

    _pgsql_common_opts=(
        {-\?,--help}'[display help]'
        # XXX This can also complete the path to a directory which
        # contains the postgresql socket (eg: /tmp).  I'm not sure how
        # to say that though.
        {-h+,--host=}':database host:_hosts'
        # Postgres doesn't like service names here, which is why we
        # don't use _ports.
        {-p+,--port=}':database port number:'
        {-U+,--username=}':connect as user:_pgsql_users'
        {-W,--password}'[prompt for password]'
    )

    # Taken from
    # <http://www.postgresql.org/docs/7.4/static/multibyte.html#CHARSET-TABLE>.
    # It'd be real nice if postgres could tell us these...
    _pgsql_encodings=(
        SQL_ASCII
        EUC_{JP,CN,KR,TW}
        JOHAB
        UNICODE
        MULE_INTERNAL
        LATIN{1,2,3,4,5,6,7,8,9,10}
        ISO_8859_{5,6,7,8}
        KOI8
        WIN
        ALT
        WIN1256
        TCVN
        WIN874
    )

    case "$service" in
        psql)     _psql "$@"     ;;
        pg_dump)  _pg_dump "$@"  ;;
        createdb) _createdb "$@" ;;
        dropdb)   _dropdb "$@"   ;;
    esac
}

_pgsql_utils "$@"

# vim: set ai et sw=4 syntax=zsh :
