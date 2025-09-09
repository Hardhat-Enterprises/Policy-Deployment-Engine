package terraform.gcp.security.lustre.lustre_instance.allowed_capacity_gib

import data.terraform.gcp.helpers
import data.terraform.gcp.security.lustre.lustre_instance.vars

conditions := [
  [
    {
      "situation_description": "capacity gib must be between 18000 and 954000, in increments of 9000.",
      "remedies": [
        "Set 'capacity_gib' to a valid value between 18000 and 954000.",
        "Ensure the value is a multiple of 9000 (e.g., 18000, 27000, 36000, etc.)."
      ]
    },
    {
      "condition": "Invalid 'capacity_gib' value for Lustre instance.",
      "attribute_path": ["capacity_gib"],
      "values": [
                "18000", "27000", "36000", "45000", "54000", "63000", "72000", "81000", "90000", "99000",
                "108000", "117000", "126000", "135000", "144000", "153000", "162000", "171000", "180000", "189000",
                "198000", "207000", "216000", "225000", "234000", "243000", "252000", "261000", "270000", "279000",
                "288000", "297000", "306000", "315000", "324000", "333000", "342000", "351000", "360000", "369000",
                "378000", "387000", "396000", "405000", "414000", "423000", "432000", "441000", "450000", "459000",
                "468000", "477000", "486000", "495000", "504000", "513000", "522000", "531000", "540000", "549000",
                "558000", "567000", "576000", "585000", "594000", "603000", "612000", "621000", "630000", "639000",
                "648000", "657000", "666000", "675000", "684000", "693000", "702000", "711000", "720000", "729000",
                "738000", "747000", "756000", "765000", "774000", "783000", "792000", "801000", "810000", "819000",
                "828000", "837000", "846000", "855000", "864000", "873000", "882000", "891000", "900000", "909000",
                "918000", "927000", "936000", "945000", "954000"
],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
