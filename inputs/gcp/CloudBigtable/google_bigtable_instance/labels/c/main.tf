terraform {
  required_providers {
    google = { source = "hashicorp/google", version = "~> 5.40" }
  }
}
provider "google" {
  project = var.project
  region  = var.region
}
variable "project" {}
variable "region"  { default = "australia-southeast1" }

resource "google_bigtable_instance" "ok" {
  name          = "pde-ok-instance"
  display_name  = "PDE OK"
  instance_type = "DEVELOPMENT"

  cluster {
    cluster_id   = "pde-ok-cluster"
    zone         = "${var.region}-b"
    num_nodes    = 1
    storage_type = "SSD"
  }

  labels = {
    k1="v1",k2="v2",k3="v3",k4="v4",k5="v5",
    k6="v6",k7="v7",k8="v8",k9="v9",k10="v10",
    k11="v11",k12="v12",k13="v13",k14="v14",k15="v15",
    k16="v16",k17="v17",k18="v18",k19="v19",k20="v20",
    k21="v21",k22="v22",k23="v23",k24="v24",k25="v25",
    k26="v26",k27="v27",k28="v28",k29="v29",k30="v30",
    k31="v31",k32="v32",k33="v33",k34="v34",k35="v35",
    k36="v36",k37="v37",k38="v38",k39="v39",k40="v40",
    k41="v41",k42="v42",k43="v43",k44="v44",k45="v45",
    k46="v46",k47="v47",k48="v48",k49="v49",k50="v50",
    k51="v51",k52="v52",k53="v53",k54="v54",k55="v55",
    k56="v56",k57="v57",k58="v58",k59="v59",k60="v60",
    k61="v61",k62="v62",k63="v63",k64="v64",k65="v65",
    k66="v66",k67="v67",k68="v68",k69="v69",k70="v70",
    k71="v71",k72="v72",k73="v73",k74="v74",k75="v75",
    k76="v76",k77="v77",k78="v78",k79="v79",k80="v80",
    k81="v81",k82="v82",k83="v83",k84="v84",k85="v85",
    k86="v86",k87="v87",k88="v88",k89="v89",k90="v90",
    k91="v91",k92="v92",k93="v93",k94="v94",k95="v95",
    k96="v96",k97="v97",k98="v98",k99="v99",k100="v100"
  }
}

