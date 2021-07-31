BEGIN { FS=","; print "<select>"}
{
    if (NR != 1) {
        if (prev != $5)
            {
                gsub("\"","",$6)
                print "<group label=\""$6"\">"
            }

        gsub("\"","",$8)
        option = "<option value=\"" $7 "\">" $8 "</option>"

        print option

        if (prev != $5)
            {
                print "</group>"
            }

        prev = $5
    }
}

END { print "</select>" }
