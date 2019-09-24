FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append := "\
    file://embed_device_tree.patch\
"
