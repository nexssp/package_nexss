package require Tk
package require Ttk
source ../../3rdPartyLibraries/jimhttp/json.tcl

set title "Package Browser - Nexss PROGRAMMER 2.0"
wm title . $title
# wm aspect . 3 2 3 2
wm geometry . 450x369
wm minsize . 450 369
wm maxsize . 1200 369

variable myLocation [file normalize [info script]]
entry .e1 -textvariable search
grid .e1 -sticky ew

bind .e1 <KeyRelease> {
   search [.e1 get]
} 

global .tree

global pkgs
set pkgs [::json::parse [exec nexss pkg list --json]] 

proc search {phrase} {
    # puts "searching for $phrase" 
    .tree delete [.tree children {}]
    global pkgs
    foreach i $pkgs {   
        set type [lindex $i 1]
        set path [lindex $i 3]      
        if {$type != ""} {            
            if {[string trimleft $phrase] == "" || [string first [string tolower $phrase] [string tolower $path]] > -1} {
               .tree insert {} end -text $path -values [list $type] 
            }
        }  
    }
}

ttk::treeview .tree -columns "Path" -displaycolumns "Path" -yscroll {.vscroll set}
.tree heading #0 -text Path -anchor center
.tree heading #1 -text Type -anchor center
.tree column #1 -minwidth 3 -width 50  -stretch NO
.tree configure -padding {0 0 0 0}
.tree configure -height 6

# pack .tree -fill both -expand 0

bind .tree {<<TreeviewSelect>>}  {
    set sel [.tree item [.tree selection]]
  
    set txt [.tree item [.tree focus] -text]
    # puts $::env(NEXSS_PACKAGES_PATH)/$txt
    set config [::json::parse [exec nexss config get --configPath $::env(NEXSS_PACKAGES_PATH)/$txt --json]] 

    array set configArray $config
    # parray  configArray
    set files ""
    if {[info exists configArray(files)]} {
        set files $configArray(files)
    }

    set seqs ""
    if {[info exists configArray(sequences)]} {
        set seqs $configArray(sequences)
    } 

    set inputs ""
    if {[info exists configArray(inputs)]} {
        set inputs $configArray(inputs)
    }

    set outputs ""
    if {[info exists configArray(outputs)]} {
        set outputs $configArray(outputs)
    }
    
    # set seqs [::json::parse [exec nexss config get --configPath $::env(NEXSS_PACKAGES_PATH)/$txt --json --select sequences]] 
    # set inputs [::json::parse [exec nexss config get --configPath $::env(NEXSS_PACKAGES_PATH)/$txt --json --select inputs]] 
    # set outputs [::json::parse [exec nexss config get --configPath $::env(NEXSS_PACKAGES_PATH)/$txt --json --select outputs]] 
    
    # puts $files
    array set v_array $files
    set var []
    
    foreach {a b} $files {
        array set vvv $b
        lappend var $vvv(name)
    }
  
    global boot
    set boot $var

    # draw canvas / graph data
    ClrCanvas .nb.f5.c
    set i [.nb.f5.c create text 200 10 -text [lindex $boot 0] -anchor n]
    foreach item [lrange $boot 1 end] {
        foreach { - - - y } [.nb.f5.c bbox $i] break
        set nexty [expr { $y + 20 }]
        .nb.f5.c create line 200 $y 200 $nexty -arrow last
        set i [.nb.f5.c create text 200 $nexty -text $item -anchor n]
    }   
}

grid .tree -sticky ew -column 0 -row 1
scrollbar .vscroll -orient vertical -command [ list .tree yview ]
grid .vscroll -sticky ns -column 1 -row 1

ttk::notebook .nb

.nb add [frame .nb.f1] -text "Boot"
.nb add [frame .nb.f2] -text "Sequences"
.nb add [frame .nb.f3] -text "Inputs"
.nb add [frame .nb.f4] -text "Outputs"
.nb add [frame .nb.f5] -text "Graph Data"
.nb select .nb.f1

pack [entry .nb.f1.e] -fill x
pack [listbox .nb.f1.lista -width 15 -height 10 -listvariable boot] -fill x
pack [listbox .nb.f2.lista -width 15 -height 10 -listvariable seqs] -fill x
pack [listbox .nb.f3.lista -width 15 -height 10 -listvariable inputs] -fill x
pack [listbox .nb.f4.lista -width 15 -height 10 -listvariable outputs] -fill x

ttk::notebook::enableTraversal .nb
grid .nb -sticky ew 

proc ClrCanvas {w} {
    $w delete "all"
}
grid [canvas .nb.f5.c -width 400 -height 300 -bg gray85]
search {}
