# COMMAND
#awk -f country_province_joomla_groupedlist_builder.awk < data/max_mind/GeoLite2-City-Locations-en.csv > output/joomla_province_groupedlist_code.xml
BEGIN { FS=","; }
{
    gsub("\"","",$6)
    gsub("\"","",$8)

    if ($6 != "" && $8 != "") {
        if (prev != $5)
            {
                country[$6]

                if (NR != 1) {
                    print "</group>"
                }
                print "<group label=\""$6"\">"
            }

        option = "<option value=\"" $7 "\">" $8 "</option>"

        if (!(option in opt)) {
            print option
        }
        opt[option]

        prev = $5
    }
}

END { print "</group>" }
