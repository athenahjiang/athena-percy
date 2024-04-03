# streams
# //anet/pipeline/core/trunk_filtered <!-- Biweekly -->
# //anet/pipeline/core/candidate_filtered <!-- Biweekly -->
# //anet/pipeline/core/devmain_filtered <!-- Biweekly -->
# //anet/pipeline/projects/COLINS_filtered <!-- COLINS -->
# //anet/pipeline/projects/COLTEC_filtered <!-- COLTEC -->
# //anet/tasks/<PROJECT_NAME>/<FEATURE_NAME> <!-- task branch -->

# manage
my_streams
full_stream_name
switch_stream <stream_name>
delete_stream <stream_name>

# create
create_stream --type task --jiraproject COLTEC --parentstream //anet/pipeline/core/devmain_filtered --streamname coltec_825_athenaconf_user_pref_key
create_stream --type task --jiraproject COLTEC --parentstream //anet/pipeline/core/candidate_filtered --streamname coltec_623_candidate
create_stream --type task --jiraproject COLTEC --parentstream //anet/pipeline/core/trunk_filtered --streamname coltec_827_enhanced_history

####
#### stream specs
####
p4 stream (add "share prod/..." to Paths)
merge_stream_down # if stream specs edited after create
p4 populate -r -S //anet/tasks/COLINS_filtered/colins_553_update_270_to_not_send_underscore
p4 sync -q
p4 add/edit/delete prod/...
p4 opened

####
#### stream control
####

# sync with task stream
p4 sync //...
p4 sync file_with_full_path
p4 resolve

# sync with parent stream
merge_stream_down
p4 resolve

# apply changelists
apply_changelists $changelist

# submit
submit_files.pl COLTEC-825 --runverifycode --runtests

# copy up
merge_stream_down
copy_stream_up

# verify
verify_copy_up changelist#
